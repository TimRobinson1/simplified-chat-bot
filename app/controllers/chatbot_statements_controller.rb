class ChatbotStatementsController < ApplicationController
  def new
    @statement = ChatbotStatement.new
    @statement.user_answers.build
  end

  def create
    @statement = ChatbotStatement.create(statement_params)
    @statement.save
    redirect_to '/'
  end

  def chatroom
    @statements = ChatbotStatement.all

    @statements.each { |s| p s.user_answers }
  end

  private

  def statement_params
    params.require(:chatbot_statement).permit(:message, user_answers_attributes: [:message, :response])
  end
end
