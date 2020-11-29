FactoryBot.define do
  factory :relationship do
    association :user 
    association :follower
    association :followed
  end
end
