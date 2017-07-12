def create_new_statement
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  select "Just chilling. You?", :from => "chatbot_statement_user_answers_attributes_0_response"
  fill_in 'answer_two', with: 'My Next Answer'
  select "Just chilling. You?", :from => "chatbot_statement_user_answers_attributes_1_response"
  find('.submit-field input').click
end

def create_statement_with_only_one_answer
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  select "Just chilling. You?", :from => "chatbot_statement_user_answers_attributes_0_response"
  find('.submit-field input').click
end

def create_invalid_statement
  # No answers present
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  select "Just chilling. You?", :from => "chatbot_statement_user_answers_attributes_0_response"
  select "Just chilling. You?", :from => "chatbot_statement_user_answers_attributes_1_response"
  find('.submit-field input').click
end

def create_statement_and_invalid_answer
  # No responses present
  visit '/admin'
  fill_in 'chatbot-statement-input', with: 'Test Message'
  fill_in 'answer_one', with: 'My Answer'
  fill_in 'answer_two', with: 'My Next Answer'
  find('.submit-field input').click
end
