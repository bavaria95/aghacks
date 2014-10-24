Rails.application.routes.draw do
<<<<<<< HEAD

  get 'profiles/index'

=======
>>>>>>> c1701cab166318b0c09b79d5dbe447e6acc61e65
  devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  root 'page#index'

  resources :skills
  resources :projects
  resources :users, only: :index
  resources :profiles

end
