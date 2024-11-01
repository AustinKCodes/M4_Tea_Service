require "rails_helper"

RSpec.describe Tea, type: :model do
  it "is has valid attributes" do
    
    tea = Tea.new(tea_name: "Green Tea", description: "Green tea", temperature: 80, brew_time: 3)
    expect(tea).to be_valid
  end
end