Rails.application.routes.draw do
	root "recipes#index"
	
    devise_for :users, controllers: { confirmations: 'confirmations' }

    resources :recipes do
      resources :reviews 
    end
end
