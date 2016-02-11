Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: :create
  end

  root 'posts#index'
end

#
  #get 'login => 'user_sessions#new'
  #post 'login => 'user_sessions#create'
  #delete 'login => 'user_sessions#destroy'
# end
