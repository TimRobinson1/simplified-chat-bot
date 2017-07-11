class AddResponseToUserAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :user_answers, :response, :string
    change_column_null :user_answers, :response, false
  end
end
