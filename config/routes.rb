Rails.application.routes.draw do
  root 'page#index'

  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

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
    resources :projects, only: :show
    match 'projects/:id/apply', to: 'projects#apply', as: "apply", via: [:post]
  end

end
