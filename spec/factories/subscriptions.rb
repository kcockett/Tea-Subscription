FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { 1.5 }
    status { "MyString" }
    frequency_months { 1 }
    customer { nil }
    tea { nil }
  end
end
