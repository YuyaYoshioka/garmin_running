Rails.application.routes.draw do
  root 'top_page#show'
  devise_for :users, controllers: { sessions: 'users/sessions', :registrations => 'users/registrations' }
  resources :posts, only: %i[new create]
end
