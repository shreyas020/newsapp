class CreateThumbnails < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.bigint  :thumbnailable_id
      t.string  :thumbnailable_type
      t.timestamps
    end
    add_index :thumbnails, [:thumbnailable_type, :thumbnailable_id]
  end
end
