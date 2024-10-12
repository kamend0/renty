class CreateUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :bedroom_count
      t.integer :bathroom_count
      t.integer :square_footage
      t.decimal :rent_price

      t.timestamps
    end
  end
end
