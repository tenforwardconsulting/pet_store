class CreateSuppliesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :brand
      t.string :quantity
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
