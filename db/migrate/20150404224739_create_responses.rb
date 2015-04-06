class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses, id: :uuid do |t|
      t.uuid :terminal_id
      t.uuid :answer_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
