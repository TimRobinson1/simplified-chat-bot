require 'rails_helper'

RSpec.describe UserAnswer, type: :model do
  it 'takes a chatbot statement id for reference' do
    statement = ChatbotStatement.create(message: 'Give me an answer')
    answer = UserAnswer.create(message: 'answer', chatbot_statement_id: statement.id)
    expect(answer.chatbot_statement_id).to eq statement.id
  end

  it 'new answers can be created for users to choose' do
    statement = ChatbotStatement.create(message: 'Give me an answer')
    answer = UserAnswer.create(message: 'answer', response: 'response', chatbot_statement_id: statement.id)
    expect(answer).to be_valid
  end

  it 'new answers cannot be created without a message' do
    answer = UserAnswer.create
    expect(answer).to_not be_valid
  end

  it 'answers cannot be created without belonging to a chatbot statement' do
    answer = UserAnswer.create(message: 'answer')
    expect(answer).to_not be_valid
  end
end
