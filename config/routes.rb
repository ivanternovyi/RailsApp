Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  scope "(:locale)", :locale => /en|ua/ do

    resources :items do
      get :upvote, on: :member
      get :expensive, on: :collection
    end

    get 'admin/users_count' => 'admin#users_count'

    root to: 'items#index'

    get '*path' => redirect('/404')
  end
end
