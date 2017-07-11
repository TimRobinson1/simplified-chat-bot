class ChatbotStatement < ApplicationRecord
  validates_presence_of :message
end
