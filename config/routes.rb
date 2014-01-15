Yoddlem::Application.routes.draw do

  resources :songs


  resources :videos


devise_for :users

  get "comments/index"
  get "comments/new"
  get 'about' => 'pages#about'
  get 'help' =>  'pages#help' 
  get 'contact' => 'pages#contact'
  get 'user' => 'users#show'




 match 'users/:id' => 'users#show', as: :user

resources :users do
  resources :messages do
    member do 
      post :reply
    end

    collection do 
      get :inbox, :sent
    end
  end

  member do
    get :following, :followers
  end

end 
 resources :yoddlevids

 resources :microposts, only: [:create, :destroy] 
 resources :relationships, only: [:create, :destroy]
resources :yoddles do
  resources :comments
end  


root :to => 'pages#home'
end