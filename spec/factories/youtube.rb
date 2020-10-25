FactoryBot.define do
  factory :youtube do
    channel_id {'UCdSPo9Iefw1REMBTPqm7DwQ'}
    channel_title {Faker::Lorem.words(number: 4, supplemental: true)}
    title {Faker::Lorem.words}
    video_id {'cEs5451Ca78'}
    description {Faker::Lorem.sentence}
  end

end