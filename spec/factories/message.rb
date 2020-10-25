FactoryBot.define do
  factory :message do
    explanation {Faker::Lorem.sentence}
    title  {Faker::Lorem.words}
    youtube
    user # youtube,user にbelongs_toしている
  end
end