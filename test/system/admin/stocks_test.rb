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

require "application_system_test_case"

class Admin::StocksTest < ApplicationSystemTestCase
  setup do
    @admin_stock = admin_stocks(:one)
  end

  test "visiting the index" do
    visit admin_stocks_url
    assert_selector "h1", text: "Stocks"
  end

  test "should create stock" do
    visit admin_stocks_url
    click_on "New stock"

    fill_in "Amount", with: @admin_stock.amount
    fill_in "Size", with: @admin_stock.size
    click_on "Create Stock"

    assert_text "Stock was successfully created"
    click_on "Back"
  end

  test "should update Stock" do
    visit admin_stock_url(@admin_stock)
    click_on "Edit this stock", match: :first

    fill_in "Amount", with: @admin_stock.amount
    fill_in "Size", with: @admin_stock.size
    click_on "Update Stock"

    assert_text "Stock was successfully updated"
    click_on "Back"
  end

  test "should destroy Stock" do
    visit admin_stock_url(@admin_stock)
    click_on "Destroy this stock", match: :first

    assert_text "Stock was successfully destroyed"
  end
end
