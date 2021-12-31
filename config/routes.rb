Rails.application.routes.draw do
  resources :ies, defaults: { format: :json }
  resources :alunos, defaults: { format: :json }
  resources :matriculas, defaults: { format: :json }
  get "/faturas", to: "faturas#index"
  get "/faturas/:id", to: "faturas#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
