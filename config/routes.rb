Rails.application.routes.draw do
  devise_for :users
  resources :articles

  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  root 'articles#index'
end
