FactoryBot.define do
  factory :youtube do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    image {Faker::Avatar.image(slug: "my-own-slug") }#=> "https://robohash.org/my-own-slug.png?size=300x300&set=set1"
  end

end