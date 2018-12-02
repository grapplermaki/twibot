Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#new'
  resources :tweets, only: [:new, :create] do
    collection do
      get 'post'
    end
  end
end
