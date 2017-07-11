class ChatbotStatementsController < ApplicationController
  def new
    @statement = ChatbotStatement.new
  end

  def create
    @statement = ChatbotStatement.create(statement_params)
    redirect_to '/'
  end

  def chatroom
    @statements = ChatbotStatement.all
  end

  private

  def statement_params
    params.require(:chatbot_statement).permit(:message)
  end
end
