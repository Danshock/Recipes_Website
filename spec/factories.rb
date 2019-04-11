FactoryBot.define do

	# sequence :email do |n|
	# 	"email#{n}@factory.com"
	# end

	# sequence :username do |n|
	# 	"username_#{n}"
	# end

	factory :user do
		email "email@factory.com"
		username "factory_username"
		password "password"
		password_confirmation "password"
	end

	factory :recipe do
		user
		title "FactoryBot Title"
		description "FactoryBot Description"
	end
end
