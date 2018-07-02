
Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show]
  get 'react-items', to: 'portfolios#React'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'


#route to pages located inside controller with 'about' being in url, to: is location
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

#homepage route
  root to: 'pages#home'
end
