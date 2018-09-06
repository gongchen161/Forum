Rails.application.routes.draw do

  root :to => 'subjects#index'

  resources :subjects do
  	member do
  	  get :delete
  	end
  end

  resources :posts do
  	member do
  	  get :delete
  	end
  end

  resources :replies do
  	member do
  	  get :delete
  	end
  end

  post 'users/login'
  get 'users/logout'
  resources :users do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
