Rails.application.routes.draw do
  devise_for :users
  root 'gigs#index'
  resources :gigs do
    collection do
      get :search
    end
  end
end
