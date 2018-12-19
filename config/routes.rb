Rails.application.routes.draw do
  resources :event_gifts, expect: %i[edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
