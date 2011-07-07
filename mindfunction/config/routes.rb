Rails.application.routes.draw do
  devise_scope :user do
    get "/mindfunction/login" => "user_sessions#new", :as => :login
    get "/mindfunction/signup" => "user_registrations#new", :as => :signup
    get "/mindfunction/account" => "users#show", :as => :account
    get "/mindfunction/account/edit" => "users#edit", :as => :account_edit
  end
 namespace :mindfunction do
	root :to => 'home#index'
	resources :home,:users,:user_sessions,:user_registrations
	resources :products 
	get 'page/team'
	get 'page/contact'
	get 'page/works'
	get 'subscribe/create'
	post 'subscribe/create'
    end

end
