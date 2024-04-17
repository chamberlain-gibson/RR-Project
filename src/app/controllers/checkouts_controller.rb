=begin
REFERENCES 
1. Jensen, C. (2023). Fullstack E-Commerce: Ruby on Rails 7, Hotwire, Tailwind, Stripe, PostgreSQL [YouTube Video]. In YouTube. https://www.youtube.com/watch?v=hURUMwdCWuI&t=1109s (https://github.com/connerj70/ecomm)

2. Sreeram Venkitesh. (2022, October 13). How To Set Up User Authentication with Devise in a Rails 7 Application. Digitalocean.com; DigitalOcean. https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application

3. Learn Hotwire and Turbo with a free Rails 7 tutorial. (2024). Learn Hotwire and Turbo with a Free Rails 7 Tutorial. https://www.hotrails.dev/turbo-rails

4. Tailwind CSS - Rapidly build modern websites without ever leaving your HTML. (2020, November 15). Tailwindcss.com; Tailwind CSS. https://tailwindcss.com/

5. What are payment rails? A guide | Stripe. (2023). Stripe.com. https://stripe.com/REFERENCES/more/what-are-payment-rails

6. PostgreSQL Tutorial. (2021). Postgresqltutorial.com. https://www.postgresqltutorial.com/

7. Beginning | Ruby on Rails Tutorial. (2014). Blackboard.com. https://alt-5fc921f3695d4.blackboard.com/bbcswebdav/courses/CSCI.33440.2022-50/rails_tutorial/beginning.html

8. chart.js. (2023, December 4). Npm. https://www.npmjs.com/package/chart.js?activeTab=readme

9. Stimulus Handbook. (2023). Hotwired.dev. https://stimulus.hotwired.dev/handbook/origin

In this controller it will hold the logic for the checkout page to interact with Stripe


Used: 
puts "hit create"
* to test if the Front-end is talking to the Back-end

* create line items and charge the customer for the item

=end

class CheckoutsController < ApplicationController 

    require 'rubygems'
    require 'stripe'

    def create
        # Getting the secret key from Stripe
        stripe_secret_key = Rails.application.credentials.dig(:stripe, :stripe_secret_key)
        Stripe.api_key = "sk_test_51OjD2NIoKzHQyfzKJrnCoUvvMtoXKnH4ks8Df02Drx6NqMQO0UyGMLqlUK8iciMcs5t072SHLGMaYoQ5Z1J75PlD009sj8edAa"
        cart = params[:cart]
        line_items = cart.map do |item|
            product = Product.find(item["id"])
            product_stock = product.stocks.find{ |ps| ps.size == item["size"] }
        
        # If a user tries to add something that is out of stock 
        # creating line items
        if product_stock.amount < item["quantity"].to_i
            render json: { error: "Not enough stock for #{product.name} in size #{item["size"]}. Only #{product_stock.amount} left. " }, status: 400
        return
        end
        
        # Fulfilling an order
        # Stright from Stripe's API documentation
        {
            quantity: item["quantity"].to_i,
            price_data: {
                product_data: {
                    name: item["name"],
                    metadata: { product_id: product.id, size: item["size"],
                product_stock_id: product_stock.id }    
                },
                currency: "usd",
                unit_amount: item["price"].to_i
            }
        }
        end

        puts "line_items: #{line_items}"

        # create a Stripe session & fill in their payment details and checkout
        session = Stripe::Checkout::Session.create(
        mode: "payment",
        line_items: line_items,
        success_url: "http://localhost:3000/success",
        cancel_url: "http://localhost:3000/cancel",
        shipping_address_collection: {
            allowed_countries: ['US', 'CA']
        }
        )
        # Stripe url
        render json: {url: session.url}
    end

    # Success after checkout
    def sucess
        render :success
    end

    # Cancel after checkout 
    def cancel
        render :cancel
    end

end
