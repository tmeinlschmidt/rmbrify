FactoryGirl.define do
	factory :note do
		content 'test'
	end

	factory :account do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end