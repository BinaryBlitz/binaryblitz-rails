Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get 'contact', to: 'pages#contact'
  get 'projects', to: 'pages#projects'
  get 'calculator', to: 'pages#calculator'
  get 'chisto', to: 'pages#chisto'
end
