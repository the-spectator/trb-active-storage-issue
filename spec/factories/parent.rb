FactoryBot.define do
  factory :parent, class: :parent do
    name { Faker::Name.first_name }
    date_of_birth { Faker::Date.birthday(min_age: 25, max_age: 65) }
    gender { Faker::Gender.binary_type }
    mobile_number { Faker::Number.number(digits: 10).to_s }
    profile_image { fixture_file_upload(Rails.root.join('spec/test_assets', 'reports.png'), 'image/png') }
  end
end
