FactoryBot.define do
  factory :message do
    explanation {Faker::Lorem.sentence}
    title  {Faker::Lorem.words}
    association :youtube
    association :user # youtube,user にbelongs_toしている
  end
end