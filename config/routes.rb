Rails.application.routes.draw do
  resources :games do
    resources :photos
  end
end
