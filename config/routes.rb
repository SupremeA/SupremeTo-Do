ToDo::Application.routes.draw do

  resources :tasks


  get 'about' => "welcome#about"

  root to: 'welcome#index'

end
