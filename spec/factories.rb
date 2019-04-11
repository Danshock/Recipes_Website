FactoryBot.define do
	factory :user do
		email "factory_user@example.com"
		username "factory_user"
		password "password"
		password_confirmation "password"
	end
end