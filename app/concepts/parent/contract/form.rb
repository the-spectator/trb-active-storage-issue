# frozen_string_literal: true

module Parent::Contract
  class Form < Reform::Form
    property :name
    property :gender
    property :mobile_number
    property :date_of_birth

    # ActiveStorage has One Attached
    property :profile_image, populator: :profile_image_populator!

    def profile_image_populator!(fragment:, model:, **)
      if fragment.is_a?(ActionDispatch::Http::UploadedFile) || fragment.is_a?(Rack::Test::UploadedFile)
        self.profile_image = fragment
      else
        skip!
      end
    end

    collection :children, populator: :children_populator!, form: Child::Contract::Form

    def children_populator!(collection:, model:, index:, fragment:, **)
      item = collection.detect { |c| !c.id.nil? && c.id.to_s == fragment[:id].to_s }
      item ? item : model.insert(index, Child.new)
    end
  end
end
