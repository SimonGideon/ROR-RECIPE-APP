Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :recipes do
    resources :recipe_foods
  end
  resources :shoppinglists
  resources :public_recipes
  post 'toggle_public', to: 'recipes#toggle'
  root "foods#index"
end
