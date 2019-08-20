FactoryBot.define do
  factory :article do
    title                  {"sample"}
    body                   {"sampletext"}
    public                 {1}
    user_id                 {1}
  end
end