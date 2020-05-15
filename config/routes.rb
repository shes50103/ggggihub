Rails.application.routes.draw do
  # root :to => 'dashboard#index'
  get "/", to: "dashboard#index", :defaults => { :format => 'html' }
  get "/:file", to: "dashboard#index", :defaults => { :format => 'html' }
  get "/:file/:file", to: "dashboard#index", :defaults => { :format => 'html' }
  get "/:file/:file/:file", to: "dashboard#index", :defaults => { :format => 'html' }
  get "/:file/:file/:file/:file", to: "dashboard#index", :defaults => { :format => 'html' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
