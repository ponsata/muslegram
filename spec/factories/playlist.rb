FactoryBot.define do
  factory :playlist do
    association :youtube
    association :user # youtube,user にbelongs_toしている
  end
end