class ChatbotStatementsController < ApplicationController
  include ChatbotStatementsHelper

  def new
    @statement = ChatbotStatement.new
    @statement.user_answers.build
  end

  def create
    @statement = ChatbotStatement.create(statement_params)
    @statement.save
    redirect_to '/'
  end

  def ending
    @statement = ChatbotStatement.new
    @statement.user_answers.build
    render 'ending'
  end

  def view
    @statements = ChatbotStatement.all
    render 'tree'
  end

  def remove
    @statements = ChatbotStatement.all
    render 'users/remove'
  end

  def destroy
     @statement = ChatbotStatement.find params[:id]
     @statement.destroy
  end

  def chatroom
    load_default_conversation if missing_statements?
    @statements = ChatbotStatement.all
    p @statements
  end

  private

  def statement_params
    params.require(:chatbot_statement).permit(:message, :status, user_answers_attributes: [:message, :response])
  end

  def missing_statements?
    ChatbotStatement.all.empty?
  end
end
