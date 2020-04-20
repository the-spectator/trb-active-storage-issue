require "rails_helper"
require "trailblazer/developer"

Dev = Trailblazer::Developer

RSpec.describe Child::Operation::Update do
  let(:uploader_class) { Class.new { include ActionDispatch::TestProcess } }
  let(:uploader_instance) { uploader_class.new }

  let(:child) { create(:child, date_of_birth: Date.today)}
  let(:base_params) {
    {
      id: child.id,
      child: child.as_json(only: [:id, :gender, :name, :date_of_birth, :parent_id])
    }.with_indifferent_access
   }

  it "passes when id_card_image is Uploader Instance" do
    base_params[:child].merge!({
      date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 18),
      id_card_image: uploader_instance.fixture_file_upload(Rails.root.join('spec/test_assets', 'ecommerce.png'), 'image/png')
    })

    result = Dev.wtf?(described_class, params: base_params)
    expect(result.success?).to be(true)
  end
end
