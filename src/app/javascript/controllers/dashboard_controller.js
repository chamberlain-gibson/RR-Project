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


*/

// Stimulus dashboard controller 
// Connnects to any object & connects to dashboard
import { Controller } from "@hotwired/stimulus"
import {Chart, registerables} from 'chart.js'

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  /*connect(){
    // testing controller 
    console.log("Hello from controller")
  } */
  
  static values = {revenue: Array}

  initialize() {
    /*Getting the Revenue data for the chart on the Admin dashboard */ 
    const data = this.revenueValue.map((item) => item[1]/100.0)
    const labels = this.revenueValue.map((item) => item[0])

    const context = document.getElementById('revenueChart')

    new Chart(context, {
      type: 'line', 
      data: {labels: labels,
        datasets: [{
          label: 'Revenue $',
          data: data,
          borderWidth: 3,
          fill: true,}]
      },
      options: {
        plugins: {legend: {display: false} },
      scales: 
        {x:{grid:{display: false}}, 
        y: {border:{dash: [5,5]}, grid:{color: "#008080"},
        beginAtZero: true}}
        }  
  })
}
}

  /*
    //dummy data 
    const data = this.revenueValue.map((item) => item)
    const labels = ["Mon", "Tues", "Wed", "Thurs", "Fri",
    "Sat", "Sun"]

    const context = document.getElementById('revenueChart')

    new Chart(context, {
      type: 'line',
      data: {labels: labels,
        datasets: [{
          label: 'Revenue $',
          data: data,
          borderWidth: 3,
          fill: true,}]
      },
      options: {
        plugins: {legend: {display: false} },
      scales: 
        {x:{grid:{display: false}}, 
        y: {border:{dash: [5,5]}, grid:{color: "#d4f3ef"},
        beginAtZero: true}}
        }  
  })
}*/


