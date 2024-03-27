# Rivers Rise E-Commerce Website 
My clients, Rivers Rise, requested a prototype e-commerce website with a functioning cloud-based database to store their products. Rivers Rise produces custom wood and macramé pieces that are made specifically for their customers. The website will entail different tabs for the types of products, a business information page, a sign-in account page, and an admin dashboard.

## Compile/Deploy
1. To compile the application:
```
$ bin/rails server

```
2. To deploy the application:
```
fly deploy
```

## Usage
Features:
1. Product Catalog: Browse through a diverse range of wood products and macramé items, including furniture, decor, plant hangers, and wall hangings.
2. Responsive Design: Access the website from any device - desktop, tablet, or smartphone - with a responsive design optimized for all screen sizes.
3. Secure Checkout: Seamless and secure checkout process with multiple payment options, including credit/debit cards, PayPal, and other online payment gateways.
4. Shipping and Delivery: Real-time shipping calculations based on location and preferred delivery method. Track orders in transit.
5. Admin Dashboard: Administrative controls for uploading new products, checking orders, and maintains sales activity tracking.

This e-commerce website offers a seamless shopping experience for customers interested in high-quality wood products and macramé items. Built on Ruby on Rails and utilizing various software packages, it provides a user-friendly interface, robust functionality, and secure transactions, catering to the needs of both buyers and sellers in the artisanal goods market.

## Options


## Testing
The standard Ruby on Rails testing format:
```
$ bin/rails test:system

```
Brakeman is a Ruby on Rails application security scanner that scans the source code of the application, identifying all security issues found, without requiring the entire application stack setup.
```
$ brakeman -o report.html

```
This report is a detailed scan summary if the Ruby on Rails application is vulernable to SQL Injection, XSS (Cross Site Scripting), XML (External Entity), CSRF (Cross Site Request Forgery), and file upload attacks. 

## REFERENCES
Blaz JW;Pearce PF. (2024). Using ruby on rails to develop a web interface: a research-based exemplar with a computerized physical activity reporter. Studies in Health Technology and Informatics, 146. https://pubmed.ncbi.nlm.nih.gov/19592849/
chart.js. (2023, December 4). Npm. https://www.npmjs.com/package/chart.js?activeTab=readme
DevGraph. (2021, April). Ruby On Rails Web Development. DEV Community; DEV Community. https://dev.to/devgraph/ruby-on-rails-web-development-1b1d
Dragonfly. (2024). Github.io. https://markevans.github.io/dragonfly/
File: README — Documentation for teamcapybara/capybara (master). (2024). Rubydoc.info. https://rubydoc.info/github/teamcapybara/capybara#using-capybara-with-rspec
Fullstack E-Commerce: Ruby on Rails 7, Hotwire, Tailwind, Stripe, PostgreSQL. (n.d.). Www.youtube.com. Retrieved February 19, 2024, from https://www.youtube.com/watch?v=hURUMwdCWuI&t=1109s
Gleb B, & Vlad V. (2019, July 13). Ruby on Rails Web Application Vulnerabilities: How to Make Your App Secure. Rubygarage.org; RubyGarage. https://rubygarage.org/blog/ruby-on-rails-web-application-vulnerabilities-how-to-make-your-app-secure
How. (2024, January 9). How to Use Brakeman to Find Rails Security Vulnerabilities - FastRuby.io | Rails Upgrade Service. How to Use Brakeman to Find Rails Security Vulnerabilities . https://www.fastruby.io/blog/how-to-use-brakeman-to-find-rails-security-vulnerabilities.html#:~:text=To%20run%20Brakeman%2C%20navigate%20to,security%20issues%20and%20their%20severity.
How To Set Up User Authentication with Devise in a Rails 7 Application | DigitalOcean. (n.d.). Www.digitalocean.com. https://www.digitalocean.com/community/tutorials/how-to-set-up-user-authentication-with-devise-in-a-rails-7-application
Labs, X. (2014). Rails Best Practices - Rails Best Practices. Rails-Bestpractices.com. https://rails-bestpractices.com/
Learn Hotwire and Turbo with a free Rails 7 tutorial. (n.d.). Learn Hotwire and Turbo with a Free Rails 7 Tutorial. https://www.hotrails.dev/turbo-rails
OWASP Secure Headers Project | OWASP Foundation. (2015). Owasp.org. https://owasp.org/www-project-secure-headers/
Paul, A., Philips, P., Dániel Szabó, & Wallace, C. (2019). The the Ruby Workshop A Practical, No-Nonsense Introduction to Ruby Development. Birmingham Packt Publishing Ann Arbor, Michigan Proquest.
PostgreSQL Tutorial - Learn PostgreSQL from Scratch. (n.d.). https://www.postgresqltutorial.com/
Przemysław Łata. (2022, September 13). Reasons for choosing Ruby on Rails for e-commerce projects. Railwaymen.org; Railwaymen Sp. z o.o. https://blog.railwaymen.org/ruby-on-rails-for-e-commerce#point-1
Roller, J. (2022, August 30). A Developer’s Insight into The Pros and Cons of Ruby on Rails. IEEE Computer Society. https://www.computer.org/publications/tech-news/build-your-career/developers-insight-into-the-ruby-on-rails
Ruby on Rails API. (2024). Rubyonrails.org. https://api.rubyonrails.org/
Ruby on Rails Guides. (2023). Ruby on Rails Guides. https://guides.rubyonrails.org/
Stimulus Handbook. (n.d.). Stimulus.hotwired.dev. Retrieved February 19, 2024, from https://stimulus.hotwired.dev/handbook/origin
Syed Fazle Rahman. (2015). Bootstrap for Rails. Packt Publishing Ltd.
Tailwind CSS Login / Sign In Form - Free Examples & Tutorial. (n.d.). TW Elements. Retrieved February 19, 2024, from https://tw-elements.com/docs/standard/forms/login-form/
tailwindcss. (2023). Tailwind CSS - Rapidly build modern websites without ever leaving your HTML. Tailwindcss.com. https://tailwindcss.com/
Viswanathan, V. (2008). Rapid Web Application Development: A Ruby on Rails Tutorial. IEEE Software, 25(6), 98–106. https://doi.org/10.1109/ms.2008.156
(2023). Stripe.com. https://docs.stripe.com/
