require "rails_helper"

RSpec.describe "Subscription Creation" do
  before(:each) do
    @customer = Customer.create!(first_name: "John", last_name: "Wick", email: "tea@gmail.com", address: "123 tea ave")
    @tea = Tea.create!(tea_name: "Green Tea", description: "Lipton", temperature: 80, brew_time: 3)
  end
  it "creates a new subscription" do

    post "/customers/#{customer.id}/subscriptions", params: { tea_id: tea.id, price: 10.00, frequency: "monthly" }

    expect(response).to have_http_status(200)
    json_response = JSON.parse(response.body)
    expect(json_response["title"]).to eq(@tea.tea_name)
  end
end