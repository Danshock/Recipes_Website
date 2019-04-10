class RemoveAuthorFromRecipe < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :author, :string
  end
end
