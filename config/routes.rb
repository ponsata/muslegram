Rails.application.routes.draw do
  devise_for :users
  root to: "youtubes#index"
 
  resources :youtubes do
    collection do
      get 'find_videos',     to: 'youtubes#results'
      get 'results',         to: 'youtubes#results'
    end
    
  end
  resources :users, only:[:edit, :show, :update]
  resources :messages, only:[:index, :new, :create, :show, :destroy]

end
