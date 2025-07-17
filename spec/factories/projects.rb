FactoryBot.define do
  factory :project do
    title { "MyString" }
    description { "MyText" }
    manager_name { "MyString" }
    state { "draft" }
  end
end
