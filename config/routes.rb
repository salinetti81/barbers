Rails.application.routes.draw do
  root 'barbers#index'
  resources :barbers
  post '/search' => 'barbers#search'
  
end

#  Prefix Verb   URI Pattern                 Controller#Action
#     barbers GET    /barbers(.:format)          barbers#index
#             POST   /barbers(.:format)          barbers#create
#  new_barber GET    /barbers/new(.:format)      barbers#new
# edit_barber GET    /barbers/:id/edit(.:format) barbers#edit
#      barber GET    /barbers/:id(.:format)      barbers#show
#             PATCH  /barbers/:id(.:format)      barbers#update
#             PUT    /barbers/:id(.:format)      barbers#update
#             DELETE /barbers/:id(.:format)      barbers#destroy
#        root GET    /                           barbers#index
