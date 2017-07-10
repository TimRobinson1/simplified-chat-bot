require 'rails_helper'

RSpec.describe User, type: :model do
  it "a valid user is created with valid inputs" do
    user = User.new
    user.name = "John Smith"
    user.email = "smith@test.com"
    user.password = "password"
    user.save
    expect(user).to be_valid
  end
end
