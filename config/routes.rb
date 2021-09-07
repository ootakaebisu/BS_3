Rails.application.routes.draw do
  get 'book_statuses/index'
  root 'users#top'
  devise_for :users
  resources :users, only:[:show] do
    resources :favorite_authors, only:[:index]
    resources :book_statuses, only:[:index]
  end

  resources :books, only:[:show, :index] do
    resources :book_statuses, only:[:create, :update, :destroy]
    resources :reviews, only:[:create, :update, :destroy] do
      resource :good_reviews, only:[:create, :destroy]
    end
    resources :responses, only:[:create, :destroy]
    resource :favorite_book, only:[:create, :destroy]
  end

  resources :authors, only:[:show, :index] do
    resource :favorite_authors, only:[:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
