require 'rails_helper'

RSpec.feature "Interface", type: :feature do
  it "Page displays the current user's name" do
    sign_up
    expect(page).to have_content 'Welcome to the chat, TestUser!'
  end

  it "Does not display a new statement if invalid" do
    sign_up
    create_invalid_statement
    expect(page).to_not have_content 'Test Message'
  end

  it "Does not display a new statement if the answer has no response" do
    sign_up
    create_statement_and_invalid_answer
    expect(page).to_not have_content 'Test Message'
  end

  it "Does not display a new statement if it has only one given answer" do
    sign_up
    create_statement_with_only_one_answer
    expect(page).to_not have_content 'Test Message'
  end
end
