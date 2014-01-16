FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password '123testing'
    password_confirmation '123testing'
  end
end