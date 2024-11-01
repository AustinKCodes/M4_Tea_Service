require "rails_helper"

RSpec.describe "Subscription Creation" do
  before(:each) do
    @customer = Customer.create!(first_name: "John", last_name: "Wick", email: "tea@gmail.com", address: "123 tea ave")
    @tea = Tea.create!(tea_name: "Green Tea", description: "Lipton", temperature: 80, brew_time: 3)
    @tea2 = Tea.create!(tea_name: "Oolong", description: "Japan's Finest", temperature: 68, brew_time: 5)
    @subscription = @customer.subscriptions.create!(tea: @tea, sub_name: "Tea Boxes", price: 9.99, status: "active", frequency: "monthly")
    @subscription2 = @customer.subscriptions.create!(tea: @tea2, sub_name: "Tea Bags", price: 5.99, status: "disabled", frequency: "yearly")
  end
  it "creates a new subscription" do

    post "/api/v1/customers/#{@customer.id}/subscriptions", params: { subscription: { tea_id: @tea.id, sub_name: "Tea Box", price: 9.99, frequency: "monthly"} }

    expect(response).to have_http_status(200)
    json_response = JSON.parse(response.body)
    expect(json_response["tea_id"]).to eq(@tea.id)
    expect(json_response["sub_name"]).to eq("Tea Box")
    expect(json_response["price"]).to eq(9.99)
  end

  it "can cancel an active subscription" do

    patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@subscription.id}", params: { subscription: { status: "disabled" } }

    expect(response).to have_http_status(200)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:status]).to eq("disabled")
  end

  it " should show all subscriptions for a customer" do
    get "/api/v1/customers/#{@customer.id}/subscriptions"

    expect(response).to have_http_status(200)
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_an(Array)
    expect(json.size).to eq(2)
    expect(json.first[:sub_name]).to eq("Tea Boxes")
    expect(json.second[:sub_name]).to eq("Tea Bags")
  end
end