FactoryBot.define do
  factory :message do
    subject { "Message Subject" }
    body { "Message Body" }
    send_to_all_users { Faker::Boolean.boolean }
    # status { "pending" }
  end
end
