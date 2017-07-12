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
  end

  private

  def statement_params
    params.require(:chatbot_statement).permit(:message, :status, user_answers_attributes: [:message, :response])
  end

  def load_default_conversation
    statement = ChatbotStatement.create(message: 'Hey!')
    UserAnswer.create(
      message: "How's it going?",
      response: "Not too bad. You?",
      chatbot_statement_id: statement.id
    )
    UserAnswer.create(
      message: "Hey! What are you up to?",
      response: 'Just chilling. You?',
      chatbot_statement_id: statement.id
    )

    statement = ChatbotStatement.create(message: 'Not too bad. You?')
    UserAnswer.create(
      message: "Yeah I'm good thanks.",
      response: "Cool.  Well, this is boring... brb",
      chatbot_statement_id: statement.id
    )
    UserAnswer.create(
      message: "Doing great! Want to browse the web for memes?",
      response: '...Literally more than anything! :D',
      chatbot_statement_id: statement.id
    )

    statement = ChatbotStatement.create(message: 'Just chilling. You?')
    UserAnswer.create(
      message: "Yeah me too.",
      response: "Cool.  Well, this is boring... brb",
      chatbot_statement_id: statement.id
    )

    UserAnswer.create(
      message: "Looking around for the funniest memes",
      response: 'Haha, ahh I love memes.',
      chatbot_statement_id: statement.id
    )

    ChatbotStatement.create(message: '...Literally more than anything! :D', status: 'pass')
    ChatbotStatement.create(message: 'Haha, ahh I love memes.', status: 'pass')
    ChatbotStatement.create(message: "Cool.  Well, this is boring... brb", status: 'fail')
  end

  def missing_statements?
    ChatbotStatement.all.empty?
  end
end
