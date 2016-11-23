class AddIconToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :icon_name, :string
  end
end
