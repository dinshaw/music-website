class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations, id: :uuid do |t|
      t.uuid :account_id
      t.string :name

      t.timestamps null: false
    end
  end
end
