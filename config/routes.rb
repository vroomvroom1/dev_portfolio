Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'


#route to pages located inside controller with 'about' being in url, to: is location
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

#homepage route
  root to: 'pages#home'
end
