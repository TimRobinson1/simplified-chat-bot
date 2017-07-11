require 'rails_helper'

RSpec.describe ChatbotStatement, type: :model do

  it 'new statements can be created for the chatbot' do
    post = ChatbotStatement.create(message: 'post message')
    expect(post).to be_valid
  end

  it 'new statements cannot be created without a message' do
    post = ChatbotStatement.create()
    expect(post).to_not be_valid
  end

end
