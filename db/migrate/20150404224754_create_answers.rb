class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, id: :uuid do |t|
      t.uuid :question_id
      t.integer :value
      t.string :label
      t.string :confirmation
      t.boolean :comment

      t.timestamps null: false
    end
  end
end
