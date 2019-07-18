FactoryBot.define do
  factory :blog do
    title { FFaker::Name.name }
    body { FFaker::Lorem.sentence }
    image { FFaker::Name.name }
    description { FFaker::Lorem.phrase }
  end
end
