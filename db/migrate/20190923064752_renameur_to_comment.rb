class RenameurToComment < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :url, :comment_body
  end
end
