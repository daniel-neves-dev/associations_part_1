FactoryBot.define do
  factory :book do
    association :author

    title { Faker::Book.title }
    publish_at { Faker::Date.in_date_period }
  end
end
