class CreateAddCommentToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :comment, :text, null: false, default: ''
  end
end
