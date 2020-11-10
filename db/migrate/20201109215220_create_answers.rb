class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.string :title, null: false
      t.text :discription, null: false

      t.timestamps

    end
  end
end
