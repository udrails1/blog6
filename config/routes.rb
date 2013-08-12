Blog::Application.routes.draw do

  # creates comments as a nested resource within posts
  resources :posts do
    resources :comments
  end
  
  get 'welcome/index'
  root 'welcome#index' 
  

end

