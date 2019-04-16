Rails.application.routes.draw do
	root "recipes#index"
	
    devise_for :users

    resources :recipes do
      resources :reviews 
    end
end
