FactoryBot.define do
  
  # factory :direction do
  #   step { "MyText" }
  #   recipe { nil }
  # end

  # factory :ingredient do
  #   name { "MyString" }
  #   recipe { nil }
  # end
    
	factory :user do
		email "email@factory.com"
		username "factory_username"
		password "password"
		password_confirmation "password"
	#	confirmed_at Time.now
	end

	factory :recipe do
		title "FactoryBotTitle"
		description "FactoryBotDescription"
		user
		category
	end

	factory :category do
		name "FactoryBotCategoryName"	
	end

	factory :review do
     	rating { 5 }
    	comment { "FactoryBot's 5 star review" }
    	user
    end

end
