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

require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_product = admin_products(:one)
  end

  test "should get index" do
    get admin_products_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_url
    assert_response :success
  end

  test "should create admin_product" do
    assert_difference("Admin::Product.count") do
      post admin_products_url, params: { admin_product: { active: @admin_product.active, category_id: @admin_product.category_id, description: @admin_product.description, name: @admin_product.name, price: @admin_product.price } }
    end

    assert_redirected_to admin_product_url(Admin::Product.last)
  end

  test "should show admin_product" do
    get admin_product_url(@admin_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_url(@admin_product)
    assert_response :success
  end

  test "should update admin_product" do
    patch admin_product_url(@admin_product), params: { admin_product: { active: @admin_product.active, category_id: @admin_product.category_id, description: @admin_product.description, name: @admin_product.name, price: @admin_product.price } }
    assert_redirected_to admin_product_url(@admin_product)
  end

  test "should destroy admin_product" do
    assert_difference("Admin::Product.count", -1) do
      delete admin_product_url(@admin_product)
    end

    assert_redirected_to admin_products_url
  end
end
