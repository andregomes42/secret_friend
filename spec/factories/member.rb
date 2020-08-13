FactoryBot.define do
 factory :member do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    campaign
 end
end