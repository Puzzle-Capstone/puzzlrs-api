Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        resources :puzzles
        resources :users, only: :show
        resources :requests, only: [:create, :update, :destroy]
    end
  end
end
