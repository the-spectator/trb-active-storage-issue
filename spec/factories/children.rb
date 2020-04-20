FactoryBot.define do
  factory :child, class: :child do
    name { Faker::Name.first_name }
    date_of_birth { Faker::Date.birthday(min_age: 25, max_age: 65) }
    gender { Faker::Gender.binary_type }
    id_card_image { fixture_file_upload(Rails.root.join('spec/test_assets', 'reports.png'), 'image/png') }

    association :parent, factory: :child
  end
end
