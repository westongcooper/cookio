Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'
  get 'home/mobile'

  get 'home/aboutus'

  resources :users, :recipes
  post 'reservations/new' => 'charges/new', as: 'new_charge'

  get 'users/user_account'
  get 'users/my_reservations_user'
  get 'login_user' => 'sessions#new_user'

  get 'chefs/chef_account'
  # get 'chefs/my_reservations_chef'
  get 'login_chef' => 'sessions#new_chef'

  get 'messages/new'

  get 'reservations/new'

  post 'sessions/login_user'
  post 'sessions/login_chef'



  resources :reservations do
    resources :messages
  end
  get 'reservations/show'
  patch 'reservations/show'
  post 'reservations/:id' => 'messages#create', as: 'messages'
  put 'reservations/:id' => 'reservations#update', as: 'make_confirmation'
  patch 'reservations/:id' => 'reservations#update'
  post 'chefs' => 'chefs#create'
  get 'chefs' => 'chefs#index', as: 'chefs_admin'
  get 'chefs/new' => 'chefs#new', as: 'new_chef'
  get 'chefs/:id' => 'chefs#show', as: 'chef'
  get 'chefs/:id/edit' => 'chefs#edit', as: 'edit_chef'
  patch 'chefs/:id' => 'chefs#update'
  put 'chefs/:id' => 'chefs#update'
  delete 'chefs/:id' => 'chefs#destroy'
  post 'chefs/:id' => 'chefs#toggle', as: 'toggle_active_chef'

  get '/logout', to: 'sessions#destroy'

end
