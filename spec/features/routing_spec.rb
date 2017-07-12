require 'rails_helper'

RSpec.feature 'Routing', type: :feature do
  it 'User is routed to correct page' do
    sign_up
    expect(find('h1')).to have_content 'Welcome to the chatroom'
  end

  scenario 'Only signed in users can access dashboard' do
    expect { visit '/admin' }.to raise_error ActionController::RoutingError
  end

  scenario 'Signed in users can access dashboard' do
    sign_up
    visit '/admin'
    expect(page).to have_content 'Admin Dashboard'
  end

  scenario 'Root visits wall even when signed in' do
    sign_up
    visit '/'
    expect(page).to have_content('Welcome to the chatroom')
  end
end
