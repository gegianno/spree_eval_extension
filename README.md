SpreeStockReport
================

Spree extension that adds a report view for all the products that in a range of dates ran out of stock.

## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_stock_report', github: 'gegianno/spree_stock_report'
  ```

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_stock_report:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.


Copyright (c) 2017 Giorgio, released under the New BSD License
