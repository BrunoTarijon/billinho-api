Rails.application.routes.draw do
  resources :ies, defaults: { format: :json }
  resources :alunos, defaults: { format: :json }
  resources :matriculas, defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
