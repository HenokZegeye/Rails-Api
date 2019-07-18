FactoryBot.define do
  factory :comment do
    name { FFaker::Name.name }
    comment { FFaker::Lorem.phrase }
    association :blog
  end
end
