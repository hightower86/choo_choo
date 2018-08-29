Rails.application.routes.draw do
  resources :trains do
    resources :vagons, shallow: true
  end
  resources :railway_stations do 
    patch :update_position,  on: :member
    patch :update_departure, on: :member
    patch :update_arrive, on: :member
  end
  resources :routes
  resource  :search, only: [:show, :edit, :new ]
	get 'welcome/index'

	root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
