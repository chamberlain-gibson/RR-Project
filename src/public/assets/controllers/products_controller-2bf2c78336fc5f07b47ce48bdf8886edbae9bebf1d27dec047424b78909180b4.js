/*
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

Products controller javascript
This allows the user to add products to the cart
*/

import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="products"
export default class extends Controller {
  // size & product values from the Products 
  static values = {size: String, product: Object }

  // Adding product values to the cart
  addToCart() {
    console.log("product: ", this.productValue)
    const cart = localStorage.getItem("cart")
    if (cart) {
      // this will happen if they do already have a cart & just add that item based on the same ID
      const cartArray = JSON.part(cart)
      const foundIndex = cartArray.findIndex(item => item.id === 
        this.productValue.id && item.size === this.sizeValue)

        // if there is a product already in our cart we can increment the quantity
        if (foundIndex >= 0){
          cartArray[foundIndex].quantity = parseInt(cartArray[foundIndex].quantity) + 1
        }

        // if we did not find a product we will just push one into the cart 
        else {
          cartArray.push({
            id: this.productValue.id,
            name: this.productValue.name,
            price: this.productValue.price,
            size: this.sizeValue,
            quantity: 1
          })
        }
      
        localStorage.setItem("cart", JSON.stringify(cartArray))
    } 
    // this is what will occur when the user add something 
    // and they don't already have a cart 
    else {
      const cartArray = []
      cartArray.push({
        id: this.productValue.id,
        name: this.productValue.name,
        price: this.productValue.price,
        size: this.sizeValue,
        quantity: 1
      })
      localStorage.setItem("cart", JSON.stringify(cartArray))
    }
  }

  // When the user selects a size & shows them the size 
  selectSize(e) {
      this.sizeValue = e.target.value
      const selectedSizeEl = document.getElementById("selected-size")
      selectedSizeEl.innerText = `Selected Size: ${this.sizeValue}`
  }




  /*
  make sure the controller is connected to the show page
  connect() {
    console.log("connected controller")*/
  
};
