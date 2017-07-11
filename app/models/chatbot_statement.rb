class ChatbotStatement < ApplicationRecord
  validates_presence_of :message
  has_many :user_answers
  accepts_nested_attributes_for :user_answers
  validates_associated :user_answers
end
