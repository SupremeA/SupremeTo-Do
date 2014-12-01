ToDo::Application.routes.draw do

  get "users/update"
  devise_for :users
    resources :users, only: [:update]
    resources :lists do
      resources :tasks, except: [:index]
    end


  get 'about' => "welcome#about"

  root to: 'welcome#index'

end
