require 'rails_helper'

RSpec.describe ChatbotStatementsController, type: :controller do
  it "creates a new chatbot statement" do
    ChatbotStatement.create(message: 'Hello, world!')
    expect(ChatbotStatement.find_by(message: "Hello, world!")).to be
  end
end
