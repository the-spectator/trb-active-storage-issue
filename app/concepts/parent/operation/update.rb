# frozen_string_literal: true

module Parent::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Parent, :find_by)
      step Contract::Build(constant: Parent::Contract::Form)
    end

    step Subprocess(Present), fast_track: true
    step Contract::Validate(key: :parent)
    step :clear_active_storage
    step Contract::Persist()
    fail :log_errors

    def clear_active_storage(ctx, **)
      ctx[:"contract.default"].profile_image = hack(ctx[:"contract.default"].profile_image)

      ctx[:"contract.default"].children.each do |x|
        x.id_card_image = hack(x.id_card_image)
      end
    end

    def log_errors(ctx, **)
      contract = ctx[:"contract.default"]
      ctx[:errors] ||= []
      ctx[:errors] << (contract.errors.full_messages || contract.model.errors)
      true
    end

    def hack(storage_object)
      if storage_object.is_a?(ActiveStorage::Attached::One) && storage_object.attached?
        storage_object.blob
      elsif storage_object.is_a?(ActiveStorage::Attached::Many) && storage_object.attached?
        storage_object.blobs
      elsif !storage_object.is_a?(ActionDispatch::Http::UploadedFile) && \
        !storage_object.is_a?(Rack::Test::UploadedFile)
        nil
      end
    end
  end
end
