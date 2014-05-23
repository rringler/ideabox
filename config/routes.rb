Ideabox::Application.routes.draw do
  devise_for :users
  get 'test_show', to: 'posts#test_show'

  concern :commentable do
    resources :comments
  end

  resources :boards do
    resources :posts, concerns: :commentable
  end

  resources :ideas

  root  'pages#home'
  match '/user/:id',   to: "users#show",
                       via: [:get],
                       as: 'user'
  match 'boards/find', to: "boards#find",
                       via: [:post],
                       as: 'find_board'
  match 'vote',        to: "votes#vote",
                       via: [:post],
                       as: 'vote'
  match 'follow',      to: "followers#follow",
                       via: [:post],
                       as: 'follow'

end
