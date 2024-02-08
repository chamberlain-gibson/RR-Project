=begin
REFERENCES
1. Jensen, C. (2023). Fullstack E-Commerce: Ruby on Rails 7, Hotwire, Tailwind, Stripe, PostgreSQL [YouTube Video]. In YouTube. https://www.youtube.com/watch?v=hURUMwdCWuI&t=1109s (https://github.com/connerj70/ecomm)

2. Sreeram Venkitesh. (2022, October 13). How To Set Up User Authentication with Devise in a Rails 7 Application. Digitalocean.com; DigitalOcean. https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application

3. Learn Hotwire and Turbo with a free Rails 7 tutorial. (2024). Learn Hotwire and Turbo with a Free Rails 7 Tutorial. https://www.hotrails.dev/turbo-rails

4. Tailwind CSS - Rapidly build modern websites without ever leaving your HTML. (2020, November 15). Tailwindcss.com; Tailwind CSS. https://tailwindcss.com/

‌5. What are payment rails? A guide | Stripe. (2023). Stripe.com. https://stripe.com/REFERENCESs/more/what-are-payment-rails

6. PostgreSQL Tutorial. (2021). Postgresqltutorial.com. https://www.postgresqltutorial.com/

7. Beginning | Ruby on Rails Tutorial. (2014). Blackboard.com. https://alt-5fc921f3695d4.blackboard.com/bbcswebdav/courses/CSCI.33440.2022-50/rails_tutorial/beginning.html
=end

require "application_system_test_case"

class Admin::ProductsTest < ApplicationSystemTestCase
  setup do
    @admin_product = admin_products(:one)
  end

  test "visiting the index" do
    visit admin_products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit admin_products_url
    click_on "New product"

    check "Active" if @admin_product.active
    fill_in "Category", with: @admin_product.category_id
    fill_in "Description", with: @admin_product.description
    fill_in "Name", with: @admin_product.name
    fill_in "Price", with: @admin_product.price
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit admin_product_url(@admin_product)
    click_on "Edit this product", match: :first

    check "Active" if @admin_product.active
    fill_in "Category", with: @admin_product.category_id
    fill_in "Description", with: @admin_product.description
    fill_in "Name", with: @admin_product.name
    fill_in "Price", with: @admin_product.price
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit admin_product_url(@admin_product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
