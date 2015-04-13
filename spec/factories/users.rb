
FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@email.com" }
  factory :user do
    name "Amy Poehler"
    email 
    password "foobar"
  end
end