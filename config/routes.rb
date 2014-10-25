Rails.application.routes.draw do

  get 'profiles/index'
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root 'page#index'

  resources :skills
  resources :projects
  resources :users
  resources :profiles
  resources :edit_skills
  resources :applies

  match 'applies/create', to: 'applies#create', as: "new_apply_post", via: :post

  namespace :api, defaults: { format: 'json' } do
    resources :projects, only: :show
    resources :users, only: :show
    # match 'projects/:id/apply', to: 'projects#apply', as: "apply", via: [:post]
    match 'users/apply/:id', to: 'users#apply', as: "apply", via: [:post]
  end

end
