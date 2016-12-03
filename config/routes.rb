Rails.application.routes.draw do
  devise_for :users
  root 'gigs#index'
  resources :gigs do
    resources :proposals
    collection do
      get :search
    end
  end

  get 'mygigs' => 'gigs#mygigs'
end
