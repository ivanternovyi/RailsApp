Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end

  resources :users

  get 'admin/users_count' => 'admin#users_count'

  root 'users#new'

end
