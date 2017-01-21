Rails.application.routes.draw do
  root 'welcome#index', as: '/'
  
devise_for :users, controllers: {registrations: "user/registrations"}

  namespace :api do
      namespace :v1 do
        resources :recipes
        mount_devise_token_auth_for 'User', at: 'auth'
        # devise_for :users, controllers: {registrations: "user/registrations"}
      end
  end


  resources :recipes
  resources :user_recipes, except: [:show, :edit, :update]

  get 'welcome/index'
  get 'my_recipes', to: 'users#my_recipes'
  get 'saved_recipes', to: 'users#saved_recipes'
  get 'my_friends', to: 'users#my_friends'
  post 'add_friend', to: 'users#add_friend'


  resources :users, only: [:show]
  resources :friendships

  devise_scope :user do 
  	get 'logout', to: 'devise/sessions#destroy'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
