require 'rails_helper'
require_relative '../support/chat_helpers'

RSpec.feature "Interface", type: :feature do
  it "Page displays the current user's name" do
    load_default_conversation
    sign_up
    click_button "How's it going?"
    expect(page).to have_content 'JHelllo'
  end
end
