Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'top_pages#show'
  devise_for :users, controllers: { sessions: 'users/sessions', :registrations => 'users/registrations' }
  resources :posts, only: %i[new create]
  resource :distance_page, only: %i[show]

  namespace :api do
    resource :month_distance, only: %i[show]
  end
end
