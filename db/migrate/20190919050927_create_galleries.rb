class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description
      t.datetime :published_at
      t.integer :status, default: 0
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
