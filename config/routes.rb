Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :versions do
    collection do
      delete :bulk_delete
    end
  end

  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  root 'articles#index'
end
