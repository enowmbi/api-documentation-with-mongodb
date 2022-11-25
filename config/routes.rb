Rails.application.routes.draw do
  root "resources#index"

  resources :resources do
    member do
      resources :field_entries
      resources :end_points do
        member do
          resources :query_parameters
        end
      end
    end
  end
end
