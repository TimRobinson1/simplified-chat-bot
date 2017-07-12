def create_new_statement
  visit '/admin/dialogue/new'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'response_one', with: "Bot responds!"
  fill_in 'answer_two', with: 'My Next Answer'
  fill_in 'response_two', with: "Bot keeps responding!"
  find('.submit-field input').click
end

def create_statement_with_only_one_answer
  visit '/admin/dialogue/new'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'response_one', with: "Bot responds!"
  find('.submit-field input').click
end

def create_invalid_statement
  # No answers present
  visit '/admin/dialogue/new'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'response_one', with: "Bot responds!"
  fill_in 'response_two', with: "Bot responds again!"
  find('.submit-field input').click
end

def create_statement_and_invalid_answer
  # No responses present
  visit '/admin/dialogue/new'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'answer_two', with: 'My Next Answer'
  find('.submit-field input').click
end
