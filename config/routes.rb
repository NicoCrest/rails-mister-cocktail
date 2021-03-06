Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  root 'cocktails#index'
  resources :cocktails, only: [:index, :create, :new, :show] do
    resources :doses, only: [:new, :create, :destroy, :show]
  end
  resources :doses, only: [:destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
