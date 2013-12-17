RestApiExample::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :users
  root to: "home#index"

  namespace :admin do
    resources :pages, except: [ :show ] do
      collection do
        post :reorder
      end
    end
  end
end
