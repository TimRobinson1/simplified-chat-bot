require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  it "Page displays the current user's name" do
    sign_up
    expect(page).to have_content 'Welcome to the chat, TestUser!'
  end
end
