
FactoryGirl.define do
  factory :gayface_user, :class => Refinery::GayfaceUsers::GayfaceUser do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

