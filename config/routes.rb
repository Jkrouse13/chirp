Rails.application.routes.draw do
  resources :posts
  scope '/api' do
    # resources :users
    post '/login' => 'users#login'
    post '/signup' => 'users#create'
    get '/index' => 'posts#index'
    get '/all' => 'posts#show_all'
    get '/users/index' => 'users#index'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
