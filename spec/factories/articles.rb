FactoryBot.define do
  factory :article do
    title                  {"sample"}
    body                   {"sampletext"}
    public                 {1}
    user_id                 {1}
    created_at              {Faker::Time.between(DateTime.now - 2, DateTime.now)}
  end
end