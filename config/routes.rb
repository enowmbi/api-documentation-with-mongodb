Rails.application.routes.draw do
  root "resources#index"

  resources :resources do
    resources :field_entries
    resources :end_points do
      resources :query_parameters
    end
  end
end
