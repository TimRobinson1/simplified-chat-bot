require 'rails_helper'

RSpec.describe UserAnswersController, type: :controller do
  it "creates a new user answer" do
    statement = ChatbotStatement.create(message: 'Hello, world!')
    UserAnswer.create(message: 'Hello, world!', response: 'response', chatbot_statement_id: statement.id)
    expect(UserAnswer.find_by(message: "Hello, world!")).to be
  end

  it "does not create a new answer with an invalid chatbot statement id" do
    UserAnswer.create(message: 'Hello, world!', chatbot_statement_id: 'id')
    expect(UserAnswer.find_by(message: "Hello, world!")).to be_nil
  end
end
