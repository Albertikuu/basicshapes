class AddUrlToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :slug, :string
  end
end
