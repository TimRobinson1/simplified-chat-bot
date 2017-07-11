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

  it "it is not valid without an email" do
    user = User.new
    user.name = "Admin"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a name" do
    user = User.new
    user.email = "admin@chatbot.com"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a password" do
    user = User.new
    user.name = "Admin"
    user.email = "admin@exchangeagram.com"
    user.save
    expect(user).to_not be_valid
  end
end
