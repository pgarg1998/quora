  Rails.application.routes.draw do


  resources  :messages
  resources  :answers, only: [:create, :destro1, :updat, :show]
  resources  :messages, only: [:create, :destro, :updat, :show]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }
  resources :users do
    post 'search',  :on => :collection
  end

  # devise_for :users
  root 'home#index'
  post '/'                               => 'home#index'
  # get '/index' => 'home#index'
  post '/create'                         => 'answers#create'

  # post '/upload_image'                   => 'home#upload_image'
  get '/profile'                         => 'home#profile'
  get '/ajax'                            => 'home#ajax'
  get '/follow'                          => 'home#follow'
  get '/un_follow'                       => 'home#un_follow'
  get '/follow1'                         => 'home#follow1'
  get '/un_follow1'                      => 'home#un_follow1'
  get '/toggle_following_button'         => 'home#toggle_following_button'
  get '/toggle_follower_button'          => 'home#toggle_follower_button'
  get '/toggle_answer_upvote'            => 'upvotes#toggle_answer_upvote'
  # get '/toggle_message_upvote'           => 'message_upvote#toggle_message_upvote'
  get '/toggle_message_downvote'         => 'messagedownvote#toggle_message_downvote'
  get '/toggle_answer_downvote'          => 'answerdownvote#toggle_answer_downvote'
  get '/Profiles'                        => 'home#Profiles'
  post '/profile'                        => 'home#profile'
  get '/toggle_message_following_button' => 'messages#toggle_message_following_button'
  post '/users/edit'                     => 'devise_for#edit'
  # get '/yourquestions'                   => 'home#yourquestions'
  post '/firstname_lastname_update'      => 'home#firstname_lastname_update'
  get '/destro'                          => 'messages#destro'
  post '/updat'                          => 'messages#updat'
  get '/destro1'                         => 'answers#destro1'
  post '/updat1'                         => 'answers#updat1'
  # get '/My_answers'                    => 'home#My_answers'
  post '/credential'                     => 'home#credential'
  post '/Description'                    => 'home#Description'
  post '/createcomment'                  => 'messagecomments#createcomment'
  get '/toggle_comment_upvote'           => 'commentupvote#toggle_comment_upvote'
  get '/toggle_comment_downvote'         => 'commentdownvote#toggle_comment_downvote'
  get '/index'                           => 'messages#index'
  get '/show'                            => 'messages#show'
  get '/createbookmark'                  => 'answerbookmark#createbookmark'
  get '/createbookmark1'                 => 'answerbookmark#createbookmark1'
  post '/show'                           => 'messages#show'
  get '/questions_api'                   => 'home#questions_api'
  get '/remove'                         => 'answerbookmark#remove'
  # get '/users/edit' => 'devise_for#edit'


  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
