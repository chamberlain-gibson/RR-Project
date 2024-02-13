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

Stimulus Cart controller 

*/


import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cart"
export default class extends Controller {
  //connect() {

      //gets the cart from storage and uploads the item
    initialize(){

      // testing if we are initializing the controller properly
      console.log("cart controller initialized")

      const cart = JSON.parse(localStorage.getItem("cart"))

      //If there is no item in the cart or a cart at all 
      if (!cart) {
        return
      }

      // testing the initial cart 
      let total = 0
      for (let i = 0; i < cart.length; i++){
        const item = cart[i]
        total += item.price * item.quantity
        const div = document.createElement("div")
        div.classList.add("mt-2")
        div.innerText = `Item: ${item.name} - $${item.price} - Size: ${item.size} - Quantity: ${item.quantity}`
        const deleteButton = document.createElement("button")
        deleteButton.innerText = "Remove"
        deleteButton.value = item.id
        deleteButton.classList.add("bg-gray-500", "rounded", "text-white","px-2", "py-1", "ml-2")
        deleteButton.addEventListener("click", this.removeFromCart)
        div.appendChild(deleteButton)
        this.element.prepend(div)
      }

      // set the total
      const totalEl = document.createElement("div")
      totalEl.innerText = `Total: $${total}`
      let totalContainer = document.getElementById("total")
      totalContainer.appendChild(totalEl)    
    }

    // remove the items from the cart 
    clear() {
      localStorage.removeItem("cart")

      //reload the page after removing the item
      window.location.reload()
    }

    // look for items in the cart based on their id & be able to remove it
    // also add functioning to "clear cart"
    removeFromCart(event){
      const cart = JSON.parse (localStorage.getItem("cart"))
      const id = event.target.value
      const index = cart.findIndex(item => item.id === id)
      cart.splice(index, 1)
      localStorage.setItem("cart", JSON.stringify(cart))

      //reload again
      window.location.reload()
    }


  }

