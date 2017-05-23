SpreeSalePriceMarkDown
======================

Introduction goes here.

## Installation

0. This gem does NOT implement sale price mechanisms.
Please make sure to implement your own version of https://github.com/jonathandean/spree-sale-pricing first.

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_sale_price_mark_down', github: 'praesens/spree_sale_price_mark_down'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_sale_price_mark_down:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.

Copyright (c) 2017 PRAESENS, released under the New BSD License
