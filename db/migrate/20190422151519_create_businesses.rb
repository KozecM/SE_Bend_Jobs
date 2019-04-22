class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :name
      t.boolean :hiring

      t.timestamps
    end
  end
end
