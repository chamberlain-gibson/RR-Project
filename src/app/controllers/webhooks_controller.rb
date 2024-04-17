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

=end

class WebhooksController < ApplicationController
    require 'rubygems'
    require 'stripe'
   # forgery protection from stripe 
    skip_forger_protection
    
    #
    def stripe
        stripe_secet_key = Rails.application.credentials.dig(:stripe, :secret_key)
        Stripe.api_key = "sk_test_51OjD2NIoKzHQyfzKJrnCoUvvMtoXKnH4ks8Df02Drx6NqMQO0UyGMLqlUK8iciMcs5t072SHLGMaYoQ5Z1J75PlD009sj8edAa"
        payload = request.body.read
        sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
        
        endpoint_secret = Rails.application.credential.dig(:dig. :webhook_secret)
        event = nil        

        #
        begin
        event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
        rescue JSON:ParserError => e
            status 400
            return
        rescue Stripe::SignatureVerificationError => e
            puts "Webhook signature verificatin failed."
            status 400
            return
        end

        #
        case event.type 
        when 'checkout.session.completed'
            session = event.data.object
            shipping_details = session["shipping_details"]
            address = "#{shipping_details['address']['line1']} #{shipping_details}
            ['address']['city'], #{shipping_details['address']['state']},
            #{shipping_details['address']['postal_code']}"
            order = Order.create!(customer_email: session["customer_details"]["email"],
            total: session["amount_total"], address: address, fulfulled: false)
            full_session = Stripe::Checkout::Session.retrieve({
                id: session.id,
                expand: ['line_items']
            })
            line_items = full_session.line_items
            line_items["data"].each do |item|

                #
                product = Stripe::Product.retrieve(item["price"]["product"])
                
                #
                product_id = product["metadata"]["product_id"].to_i
                
                #
                OrderProduct.create!(order: order, product_id: product_id, quantity: item["quantity"], size: product["metadata"]["size"])
                
                #
                Stock.find(product["metadata"]["product_stock_id"]).decrement!(:amount, item["quantity"])
            end

        #            
        else
            puts "Unhandled event type: #{event.type}"
        end

        render json: {message: 'success'}


    end
end