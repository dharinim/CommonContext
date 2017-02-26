Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mentors #TODO: Determine if we need to limit any of these routes
  resources :mentees do 
  	resources :matches
  end
  root 'mentors#show'

end
