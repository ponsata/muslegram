FactoryBot.define do
  factory :playlist do
    youtube
    user # youtube,user にbelongs_toしている
  end
end