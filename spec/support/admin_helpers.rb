def create_new_statement
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'response_one', with: 'My Response'
  fill_in 'answer_two', with: 'My Next Answer'
  fill_in 'response_two', with: 'My Next Response'
  find('.submit-field input').click
end

def create_statement_with_only_one_answer
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'response_one', with: 'My Response'
  find('.submit-field input').click
end

def create_invalid_statement
  # No answers present
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'response_one', with: 'My Response'
  fill_in 'response_two', with: 'My Response'
  find('.submit-field input').click
end

def create_statement_and_invalid_answer
  # No response present
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'answer_two', with: 'My Next Answer'
  find('.submit-field input').click
end
