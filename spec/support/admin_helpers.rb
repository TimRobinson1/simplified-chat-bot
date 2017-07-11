def create_new_statement
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer', with: 'My Answer'
  fill_in 'response', with: 'My Response'
  find('.submit-field input').click
end
