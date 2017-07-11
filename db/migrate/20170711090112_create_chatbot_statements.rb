class CreateChatbotStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :chatbot_statements do |t|
      t.string :message, null: false

      t.timestamps
    end
  end
end
