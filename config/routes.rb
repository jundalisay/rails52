Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    # get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
    get '/users/auth/failure' => 'sessions#failure'
    post 'users/sign_up', to: 'devise/registrations#create'
  end 
  
  namespace :v1 do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users, param: :access_token
  end

  scope "(:locale)", locale: /en|fr|ja|tl|vi|zh/ do
    root 'users#index'
    resources :users
  end

end
