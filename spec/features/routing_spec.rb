require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  it "User is routed to correct page" do
    sign_up
    expect(find('h1')).to have_content 'Welcome to the chatroom'
  end

  scenario "Can only visit wall when signed in" do
    visit "/"
    expect(page).not_to have_content('Welcome to the chatroom')
  end

  scenario "Root visits wall when signed in" do
    sign_up
    visit "/"
    expect(page).to have_content('Welcome to the chatroom')
  end
end
