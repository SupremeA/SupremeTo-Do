ToDo::Application.routes.draw do

  devise_for :users
    resources :lists do
      resources :tasks, except: [:index]
    end


  get 'about' => "welcome#about"

  root to: 'welcome#index'

end
