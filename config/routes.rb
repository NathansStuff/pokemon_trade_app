Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :items
  resource :charges
  root 'items#index'
  get 'selling' => 'sellings#index'

end
