class AddStatusToChatbotStatements < ActiveRecord::Migration[5.1]
  def change
    add_column :chatbot_statements, :status, :string
  end
end
