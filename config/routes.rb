Rails.application.routes.draw do
  # root :to => 'dashboard#index'
  get "/", to: "dashboard#index"
  get "/:file", to: "dashboard#index"
  get "/:file/:file", to: "dashboard#index"
  get "/:file/:file/:file", to: "dashboard#index"
  get "/:file/:file/:file/:file", to: "dashboard#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
