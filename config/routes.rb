Rails.application.routes.draw do
  root 'top_pages#show'
  devise_for :users, controllers: { sessions: 'users/sessions', :registrations => 'users/registrations' }
  resources :posts, only: %i[new create]
  resource :distance_page, only: %i[show]
end
