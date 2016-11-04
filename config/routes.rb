Rails.application.routes.draw do
  resources :posts
  scope '/api' do
    # resources :users
    post '/login' => 'users#login'
    post '/signup' => 'users#create'
    get '/index' => 'posts#index'   #timeline
    get '/post/show' => 'posts#show' #sends one specific chirp, needs the id of the chirp that you want to see
    get '/all' => 'posts#show_all' #sends every chirp
    get '/users/index' => 'users#index' #sends every user
    get '/follow' => 'users#follow_user' #the current user follows the user whose id is supplied, requires an api_token
    get '/unfollow' => 'users#unfollow_user' #the current user unfollows the user whose id is supplied, requires an api_token
    get '/followers' => 'users#all_followers' #sends back all of a users followers, needs id of the main FOLLOWEE
    post '/chirp' => 'posts#create' #creates new chirp
    get '/user' => 'users#show'  #send currentusers info back requires api_token
    get '/my_chirps' => 'users#my_chirps' #sends currentusers posts back, needs api_token
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  
