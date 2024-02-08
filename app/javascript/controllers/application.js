/*
REFERENCES
1. Jensen, C. (2023). Fullstack E-Commerce: Ruby on Rails 7, Hotwire, Tailwind, Stripe, PostgreSQL [YouTube Video]. In YouTube. https://www.youtube.com/watch?v=hURUMwdCWuI&t=1109s (https://github.com/connerj70/ecomm)

2. Learn Hotwire and Turbo with a free Rails 7 tutorial. (2024). Learn Hotwire and Turbo with a Free Rails 7 Tutorial. https://www.hotrails.dev/turbo-rails

3. Tailwind CSS - Rapidly build modern websites without ever leaving your HTML. (2020, November 15). Tailwindcss.com; Tailwind CSS. https://tailwindcss.com/

‌4. What are payment rails? A guide | Stripe. (2023). Stripe.com. https://stripe.com/resources/more/what-are-payment-rails

‌5. PostgreSQL Tutorial. (2021). Postgresqltutorial.com. https://www.postgresqltutorial.com/

6. Beginning | Ruby on Rails Tutorial. (2014). Blackboard.com. https://alt-5fc921f3695d4.blackboard.com/bbcswebdav/courses/CSCI.33440.2022-50/rails_tutorial/beginning.html
*/




import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
