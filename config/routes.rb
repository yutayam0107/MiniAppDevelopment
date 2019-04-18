Rails.application.routes.draw do
root 'blogs#index'
resources :blogs
devise_for :users
end
