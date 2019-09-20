class CreateCatalogs < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogs do |t|
      t.string :name
      t.integer :ctype

      t.timestamps
    end
    add_index :catalogs, :name
    add_index :catalogs, :ctype
  end
end
