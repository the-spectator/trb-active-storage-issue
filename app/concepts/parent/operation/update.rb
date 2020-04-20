# frozen_string_literal: true

module Parent::Operation
  class Update < ApplicationOperation
    class Present < Trailblazer::Operation
      step Model(Parent, :find_by)
      step Contract::Build(constant: Parent::Contract::Form)
    end

    step Subprocess(Present), fast_track: true
    step Contract::Validate(key: :parent)
    # step :clear_active_storage
    step Contract::Persist()
    fail :log_errors

    def clear_active_storage(ctx, **)
      # ctx[:"contract.default"].profile_image = hack(ctx[:"contract.default"].profile_image)

      ctx[:"contract.default"].children.each do |x|
        x.id_card_image = hack(x.id_card_image)
      end
      true
    end
  end
end
