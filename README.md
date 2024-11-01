# README

## To Run and Install properly
Clone the repository and run git clone "the clone link" in your terminal in the desired directory
After opening it run "bundle install" to get the required dependencies
Run "rails db:{drop,create,migrate,seed}" to set up the database

## Running Test Suite (RSpec)
In terminal just run "bundle exec rspec" to run the whole suite

### This Tea subscription API is great for getting all your Tea needs from our hypothetical website! Here you can subscribe to one of our subscriptions for weekly, monthly, or yearly shipments of our finest teas. If for some reason you do wish to cancel we have that option too.

### Endpoints

1. Creating a subscription
    - POST http://localhost:3000/api/v1/customers/:customer_id/subscriptions
    - Params: { subscription: { tea_id: tea.id, sub_name: "Tea Box", price: 9.99, frequency: "monthly"} }

2. Cancelling a subscription
    - PATCH http://localhost:3000/api/v1/customers/:customer_id/subscriptions/:subscription_id
    _ Params: { subscription: { status: "disabled" } }

3. Get all subscriptions for a given customer
    - GET http://localhost:3000/api/v1/customers/:customer_id/subscriptions

