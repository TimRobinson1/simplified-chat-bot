require 'rails_helper'

RSpec.feature "Interface", type: :feature do
  it "Page displays the current user's name" do
    sign_up
    expect(page).to have_content 'Welcome to the chat, TestUser!'
  end

  it "Page displays new post" do
    sign_up
    create_new_statement
    expect(page).to have_content 'Test Message'
  end

  it "Page displays post answer" do
    sign_up
    create_new_statement
    expect(page).to have_content 'My Answer'
  end
end
