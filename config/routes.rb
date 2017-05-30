Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  scope '(:locale)', locale: /en|ru/ do
    get 'contact', to: 'callback_requests#new'

    get 'projects', to: 'pages#projects'
    get 'calculator', to: 'price_estimations#new'

    # Projects
    get 'chisto', to: 'projects#chisto'
    get 'sportup', to: 'projects#sportup'
    get 'gethelp', to: 'projects#gethelp'
    get 'academia', to: 'projects#academia'
    get 'zp', to: 'projects#zp'
    get 'justforyou', to: 'projects#justforyou'
    get '1na1', to: 'projects#1na1'
    get 'getfit', to: 'projects#getfit'

    resources :callback_requests, only: [:create]
    resources :price_estimations, only: [:create]
  end
end
