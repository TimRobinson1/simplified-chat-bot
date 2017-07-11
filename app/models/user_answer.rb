class UserAnswer < ApplicationRecord
  validates_presence_of :message, :response
  belongs_to :chatbot_statement
end
