=begin
REFERENCES
1. Jensen, C. (2023). Fullstack E-Commerce: Ruby on Rails 7, Hotwire, Tailwind, Stripe, PostgreSQL [YouTube Video]. In YouTube. https://www.youtube.com/watch?v=hURUMwdCWuI&t=1109s (https://github.com/connerj70/ecomm)

2. Sreeram Venkitesh. (2022, October 13). How To Set Up User Authentication with Devise in a Rails 7 Application. Digitalocean.com; DigitalOcean. https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application

3. Learn Hotwire and Turbo with a free Rails 7 tutorial. (2024). Learn Hotwire and Turbo with a Free Rails 7 Tutorial. https://www.hotrails.dev/turbo-rails

4. Tailwind CSS - Rapidly build modern websites without ever leaving your HTML. (2020, November 15). Tailwindcss.com; Tailwind CSS. https://tailwindcss.com/

‌5. What are payment rails? A guide | Stripe. (2023). Stripe.com. https://stripe.com/resources/more/what-are-payment-rails

6. PostgreSQL Tutorial. (2021). Postgresqltutorial.com. https://www.postgresqltutorial.com/

7. Beginning | Ruby on Rails Tutorial. (2014). Blackboard.com. https://alt-5fc921f3695d4.blackboard.com/bbcswebdav/courses/CSCI.33440.2022-50/rails_tutorial/beginning.html
=end

# Routes file for all the links 
Rails.application.routes.draw do
  namespace :admin do #admin route
      resources :orders #orders
      resources :products do 
    resources :stocks # nested stocks routes in products 
    end
    resources :categories #categories 
  end
  devise_for :admins # devise method for the admin
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "up" => "rails/health#show", as: :rails_health_check


  # Defines the root path route ("/")
   root "home#index"
  
   # After /admins/sign_in if entered the authenticated sign in 
   authenticated :admin_user do 
    root to: "admin#index", as: :admin_root
   end

   # After sign in the user is taken to the admin index
   get "admin" => "admin#index"

  
  end
