Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'
  match 'main/fair', to: 'main#fair', via: [:get]
  match 'main/save', to: 'main#save', via: [:post]
end
