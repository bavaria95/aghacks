Rails.application.routes.draw do

  get 'profiles/index'
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root 'page#index'

  resources :skills
  resources :projects
  resources :users, only: :index
  resources :profiles
  resources :edit_skills

end
