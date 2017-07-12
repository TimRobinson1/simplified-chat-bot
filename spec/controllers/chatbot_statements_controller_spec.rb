require 'rails_helper'

RSpec.describe ChatbotStatementsController, type: :controller do
  it 'creates a new chatbot statement' do
    ChatbotStatement.create(message: 'Hello, world!')
    expect(ChatbotStatement.find_by(message: 'Hello, world!')).to be
  end

  it 'can be created with a status of pass' do
    statement = ChatbotStatement.create(message: 'Victory!', status: 'pass')
    expect(ChatbotStatement.find_by(message: 'Victory!').status).to eq 'pass'
  end

  it 'can be created with a status of fail' do
    statement = ChatbotStatement.create(message: 'Failed!', status: 'fail')
    expect(ChatbotStatement.find_by(message: 'Failed!').status).to eq 'fail'
  end
end
