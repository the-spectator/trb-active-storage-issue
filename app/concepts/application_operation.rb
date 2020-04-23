# frozen_string_literal: true

class ApplicationOperation < Trailblazer::Operation

  def log_errors(ctx, **)
    contract = ctx[:"contract.default"]
    ctx[:errors] ||= []
    ctx[:errors] << (contract.errors.full_messages || contract.model.errors).flatten
    true
  end

  private

  def hack(storage_object)
    if storage_object.is_a?(ActiveStorage::Attached::One) && storage_object.attached?
      storage_object.blob
    elsif storage_object.is_a?(ActiveStorage::Attached::Many) && storage_object.attached?
      storage_object.blobs
    elsif storage_object.is_a?(ActionDispatch::Http::UploadedFile) || storage_object.is_a?(Rack::Test::UploadedFile)
      storage_object
    else
      nil
    end
  end
end
