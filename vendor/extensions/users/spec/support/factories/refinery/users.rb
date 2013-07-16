
FactoryGirl.define do
  factory :user, :class => Refinery::Users::User do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

