require "api_constraints"
  namespace :api, defaults: {format: "json"} do
    devise_scope :user do
      post "sign_in", to: "sessions#create"
      post "sign_up", to: "registrations#create"
      delete "sign_out", to: "sessions#destroy"
    end
 
    scope module: :v1,
     constraints: ApiConstraints.new(version: 1, default: true) do
     get "search", to: "search#search"
     resources :users, only: %i(show update destroy)
     resources :groups
     resources :member_groups
     resources :events
     resources :member_events
     resources :admin_events
   end
end
# require "api_constraints"

# namespace :api, defaults: {format: "json"} do
#   devise_scope :user do
#     post "sign_in", to: "sessions#create"
#     post "sign_up", to: "registrations#create"
#     delete "sign_out", to: "sessions#destroy"
#   end

#   scope module: :v1,
#     constraints: ApiConstraints.new(version: 1, default: true) do
#     resources :users, only: :show
#   end
# end