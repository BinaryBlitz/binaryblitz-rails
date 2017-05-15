Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  scope '(:locale)', locale: /en|ru/ do
    get 'contact', to: 'callback_requests#new'
    get 'projects', to: 'pages#projects'
    get 'calculator', to: 'pages#calculator'
    get 'chisto', to: 'pages#chisto'
    get 'sportup', to: 'pages#sportup'
    get 'gethelp', to: 'pages#gethelp'
    get 'academia', to: 'pages#academia'
    get 'zp', to: 'pages#zp'
    get 'justforyou', to: 'pages#justforyou'
    get '1na1', to: 'pages#1na1'
    get 'getfit', to: 'pages#getfit'

    resources :callback_requests, only: [:create]
  end
end
