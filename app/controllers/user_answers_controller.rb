class UserAnswersController < ApplicationController
  def message
    @answer = UserAnswer.find_by_message(params[:message]).response
    @statement = ChatbotStatement.find_by_message(@answer)
    if @statement.status
      render 'end', layout: false
    else
      render 'message', layout: false
    end
  end
end
