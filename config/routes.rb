Rails.application.routes.draw do
  root 'page#index'

  devise_for :user, :controllers => { :registrations => "registrations" }, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

  get 'profiles/index'
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :skills
  resources :projects
  resources :users
  resources :profiles
  resources :edit_skills
  resources :applies

  match 'applies/create', to: 'applies#create', as: "new_apply_post", via: :post

  namespace :api, defaults: { format: 'json' } do
    resources :users, only: :show
    match 'users/apply/:id', to: 'users#apply', as: "apply", via: [:post]
    match 'users/remove', to: 'users#remove', as: "remove", via: [:post]
  end

end
