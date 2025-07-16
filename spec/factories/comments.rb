FactoryBot.define do
  factory :comment do
    commenter_name { "MyString" }
    details { "MyText" }
    project { nil }
  end
end
