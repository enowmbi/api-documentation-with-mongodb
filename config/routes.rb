Rails.application.routes.draw do
  root "resources#index"

  resources :resources do
    member do
      resources :field_entries
    end
  end
end
