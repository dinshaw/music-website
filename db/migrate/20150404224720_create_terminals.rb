class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals, id: :uuid do |t|
      t.uuid :location_id
      t.uuid :question_id
      t.string :name

      t.timestamps null: false
    end
  end
end
