class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :long_description
      t.string :short_description
      t.string :status, default: :created
      t.datetime :published_at

      t.timestamps
    end
  end
end
