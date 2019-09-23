class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :url
      t.bigint  :mediable_id
      t.string  :mediable_type
      t.timestamps
    end
    add_index :media, [:mediable_type, :mediable_id]
  end
end
