Rails.application.routes.draw do
 resources :bloggers, only: [:index, :show, :new, :create]
 resources :destinations, only: [:index, :show, :new]
 resources :posts, only: [:index, :show, :new,:create,:edit,:update]

 post '/addlike/:post_id', to: 'posts#like_post', as: 'addlike'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
