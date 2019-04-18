FactoryBot.define do
  factory :direction do
    step { "MyText" }
    recipe { nil }
  end
  factory :ingredient do
    name { "MyString" }
    recipe { nil }
  end
  factory :review do
    rating { 1 }
    comment { "MyText" }
  end

	factory :user do
		email "email@factory.com"
		username "factory_username"
		password "password"
		password_confirmation "password"
	end

	factory :recipe do
		title "FactoryBotTitle"
		description "FactoryBotDescription"
		user
		category
	end

	factory :category do
		name "FactoryBotCategoryName"
		recipe
	end
end
