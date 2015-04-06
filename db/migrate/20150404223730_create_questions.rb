class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions, id: :uuid do |t|
      t.uuid :account_id
      t.string :body
      t.integer :number_of_answers

      t.timestamps null: false
    end
  end
end
