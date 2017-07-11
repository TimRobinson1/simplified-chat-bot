class ChatbotStatement < ApplicationRecord
  validates_presence_of :message
  has_many :user_answers
end
