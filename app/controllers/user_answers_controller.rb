class UserAnswersController < ApplicationController
  def message
    @answer = UserAnswer.find_by_message(params[:message]).response
    @statement = ChatbotStatement.find_by_message(@answer)
    render :layout => false
  end
end
