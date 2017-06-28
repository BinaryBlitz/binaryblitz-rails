Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  scope '(:locale)', locale: /en|ru/ do
    get 'contact', to: 'callback_requests#new'

    get 'projects', to: 'pages#projects'
    get 'calculator', to: 'price_estimations#new'

    # Projects
    scope 'projects', controller: :projects do
      get 'academia', 'chisto', 'gethelp', 'justforyou', 'sportup', 'onevsone'
    end

    resources :callback_requests, only: [:create]
    resources :price_estimations, only: [:create]
  end
end
