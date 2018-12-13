# Jungle-Rails (Lighthouse Labs Rails application)

# Introduction

In order to practice working with unfamiliar territory (Ruby and Rails) in a code-base that is inherited (Jungle Rails - link below), reviewed ruby and rails documentations in order to practice ruby and rails by implementings the features, bugs, and tests listed below. Jungle Rails is a simple E-commerce copy site that implements Ruby and Rails for both front end and back end. The initial state of the application can be found at the following repository link <https://github.com/lighthouse-labs/jungle-rails/>. The following were added and implemented to this project:

1. feature/sold-out-badge (items at quantity 0 indicate with sold-out label)
2. feature/admin-categories (admins can create categories) > TODO: Admins should be able to delete categories.
3. feature/users (user authentication with bcrpyt gem)
4. feature/order-details (order details at final checkout point improved)
5. feature/order-receipt (Action Mailer set-up in development environment) > TODO: plans to production will require controlled testing.
6. feature/admin-basic-auth (administrative authentication for access to specific admin pages implemented)
7. feature/empty-cart-fix (empty cart checkout bug fixed)
8. Unit and Spec testing available for basic tasks:
  - product creation
  - user creation
  - product details page
  - user login feature
  - adding items to cart feature
9. Deployed to heroku
  - Updated Ruby to 2.4.5 and Rails to 5.2.2
  - Other required Gem files updated accordingly to accommodate Heroku ruby and rails version requirements
  - Removed deprecated gem file codes
  - TODO > image files not being saved in heroku database once user server connection resets

TODO > admin dashboard

# Visit the Heroku Deployed site

<https://jungle-rails-bert2018.herokuapp.com/>

Instructions below on accessing the application locally.

TODO:
  - Image not saving on heroku database
  - DB seed once image bug is fixed

# Required Gems

-rails, 5.2.2
-activesupport, 5.2.2
-actionpack, 5.2.2
-pg
-sass-rails, ~> 5.0.6
-railties, 5.2.2
-uglifier, >= 1.3.0
-jquery-rails
-turbolinks
-jbuilder, ~> 2.0
-sdoc, ~> 0.4.0, group: :doc
-bcrypt, ~> 3.1.7
-puma
-bootstrap-sass, ~> 3.3.6
-font-awesome-rails
-money-rails
-carrierwave
-rmagick
-stripe
-faker

# Dev Specific

-'byebug'
-'dotenv-rails'
-'rspec-rails', '3.8.1'
-'capybara'
-'poltergeist'
-'database_cleaner'
-'web-console', '~> 2.0'
-'spring'

# How to start

If you want to work with the existing code, fork and clone the repository.

Run the following commands in your terminal (linux):
  - rake db:reset
  - rake db:seed  (previous command should ensure this is completed, but just in-case to ensure that the data is seeded)
  - bin/rails b -s 0.0.0.0

Open the browser at http://localhost.3000

## Stripe Testing @ product checkout

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Ensure that the expiration date is in the future and any 3 digit security number will work for testing purposes/

More information in their docs: <https://stripe.com/docs/testing#cards>


# Jungle (Initial code base)

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
<https://github.com/lighthouse-labs/jungle-rails/>

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server


## Dependencies (initial code base version)

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
