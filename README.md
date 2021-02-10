# Jungle

A mini e-commerce application built with Rails 4.2. The application was already functional and most part of the code already implemented. For this project the students were asked to fix some bugs and implement some new features.


## Getting Started

1. Run `bundle install` to install dependencies
2. Run `bin/rake db:reset` to create, load and seed db
3. Sign up for a Stripe account
4. Put Stripe (test) keys into appropriate .env vars
5. Run `bin/rails s -b 0.0.0.0` to start the server


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

!["Screenshot of the home page"](https://github.com/analuciachin/jungle-rails/blob/master/docs/jungle_home.png)

!["Screenshot of the cart"](https://github.com/analuciachin/jungle-rails/blob/master/docs/jungle_cart.png)

!["Screenshot of the admin > products"](https://github.com/analuciachin/jungle-rails/blob/master/docs/jungle_admin_products.png)

!["Screenshot of the login page"](https://github.com/analuciachin/jungle-rails/blob/master/docs/jungle_login.png)


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
