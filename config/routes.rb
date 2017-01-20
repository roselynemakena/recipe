Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
    resources :recipes
   end
  end


  resources :recipes
  devise_for :users, controllers: {registrations: "user/registrations"}

  resources :user_recipes, except: [:show, :edit, :update]

  get 'welcome/index'
  get 'my_recipes', to: 'users#my_recipes'
  get 'my_friends', to: 'users#my_friends'
  post 'add_friend', to: 'users#add_friend'

  root 'welcome#index', as: '/'

  resources :users, only: [:show]
  resources :friendships

  devise_scope :user do 
  	get 'logout', to: 'devise/sessions#destroy'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
