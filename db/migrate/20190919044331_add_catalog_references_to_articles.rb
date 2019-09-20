class AddCatalogReferencesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference(:articles, :catalog)
    #add_belongs_to()
  end
end
