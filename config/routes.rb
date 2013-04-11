Moederse::Application.routes.draw do
  get "site/about"

  match 'recipes/all/edit' => 'recipes#edit_all', :as => :edit_all, :via => :get
  match 'recipes/all' => 'recipes#update_all', :as => :update_all, :via => :put

  opinio_model

  root :to => 'recipes#index'

  match 'recepten/nieuw' => 'recipes#new', :as => 'new_recipe'
  match 'recepten/index' => 'recipes#index', :as => 'recipes_index'
  get 'recepten' => 'recipes#list', :as => 'list_recipes'
  resources :recipes

  match "/categorie/:type" => "recipes#show_category"

  get 'ingredients' => 'recipes#ingredients' #, :on => :collection

  resources :posts do
    opinio
  end

  devise_for :users, :skip => [:registrations]
      as :user do
        get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
        put 'users' => 'devise/registrations#update', :as => 'user_registration'
        match 'uitnodigingen/nieuw' => 'devise/invitations#new', :as => "new_invitation"
      end
end
