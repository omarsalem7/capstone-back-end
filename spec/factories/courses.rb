FactoryBot.define do
  factory :course do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    location { 'Test location' }
    size { '20 by 40' }
    price { '100' }
    image { 'photo.png' }
  end
end
