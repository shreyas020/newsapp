Rails.application.routes.draw do
  resources :catalogs do
    resources :polls
    resources :galleries
    resources :articles
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end