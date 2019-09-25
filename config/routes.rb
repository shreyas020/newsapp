Rails.application.routes.draw do
  resources :catalogs do
    resources :polls do
      resources :comments, module: :polls
      resources :media, module: :polls
      resources :thumbnails, module: :polls
    end
    resources :galleries do
      resources :comments, module: :galleries
      resources :media, module: :galleries
      resources :thumbnails, module: :galleries
    end 
    resources :articles do
      resources :comments, module: :articles
      resources :media,  module: :articles
      resources :thumbnails, module: :articles
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
