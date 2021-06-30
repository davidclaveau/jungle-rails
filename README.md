# Jungle

A mini e-commerce application built with Rails 4.2. Built from existing Lighthouse Labs code to gain experience understanding, working in, and modifying an established code base.

---

## Final Product

#### Homepage of Jungle
![Homepage of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/home-page.png)

#### Product Page of Jungle
![Product Page of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/product-page.png)

#### Signup Page of Jungle
![Signup Page of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/signup-page.png)

#### Cart Page of Jungle
![Cart Page of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/cart-page.png)

#### Order Confirmation Page of Jungle
![Order Confirmation Page of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/order-confirmation-page.png)

#### Admin Product Page of Jungle
![Admin Product Page of Jungle](https://raw.githubusercontent.com/davidclaveau/jungle-rails/master/public/images/admin-add-products-page.png)

---

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

---

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

---

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

**Have fun!**