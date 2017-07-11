class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.string :message
      t.references :chatbot_statement, foreign_key: true

      t.timestamps
    end
  end
end
