require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  it "Page displays the current user's name" do
    sign_up
    expect(page).to have_content 'Welcome to the chat, TestUser!'
  end

  it "Page displays new post" do
    sign_up
    visit '/admin'
    fill_in 'chatbot-statement-input', with: 'Test Message'
    find('.submit-field input').click
    expect(page).to have_content 'Test Message'
  end
end
