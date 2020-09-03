Rails.application.routes.draw do

  devise_for :users
  get 'users/index'
  get 'users/show'
  root to: "youtubes#index"
  resources :youtubes do
    collection do
      get 'find_videos',     to: 'youtubes#results'
      post 'results',         to: 'youtubes#results'
      
    end
  end
  resources :messages
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
