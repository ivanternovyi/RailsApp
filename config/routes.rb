Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks:
                                             'users/omniauth_callbacks' }

  scope '(:locale)', locale: /en|ua/ do

    resources :items do
      get :upvote, on: :member
      get :add_to_cart, on: :member
      # get :expensive, on: :collection
    end

    resources :cart, only: :index do
      get :remove_item, on: :member
    end

    get 'admin', to: 'admin#info'

    root to: 'items#index'

    get '*path' => redirect('/404')
  end
end
