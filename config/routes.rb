Rails.application.routes.draw do
  root 'books#top'
  get 'top' => 'books#top'
  get '/home/about' => 'books#about'
  devise_for :users
  resources :books do
  	resource :post_comments
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
