Rails.application.routes.draw do
  get 'users/show'
  root 'root#top'
  get '/about' => 'root#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "books#index"
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end

  resources :users, only: [:show, :edit, :update, :index]

end
