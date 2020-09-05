Rails.application.routes.draw do
  
  #get 'users/index'
  #get 'users/show'
  root to: "youtubes#index"
  resources :youtubes do
    collection do
      get 'find_videos',     to: 'youtubes#results'
      get 'results',         to: 'youtubes#results'
    end
    resources :messages, only:[:index, :new, :create, :show, :destroy]
  end
  
end
