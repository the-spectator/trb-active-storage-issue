# frozen_string_literal: true

module Child::Contract
  class Form < Reform::Form
    property :name
    property :gender
    property :date_of_birth
    property :parent_id

    # ActiveStorage has One Attached
    property :id_card_image, populator: :id_card_image_populator!

    def id_card_image_populator!(fragment:, model:, **)
      if fragment.is_a?(ActionDispatch::Http::UploadedFile) || fragment.is_a?(Rack::Test::UploadedFile)
        self.id_card_image = fragment
      else
        skip!
      end
    end

  end
end
