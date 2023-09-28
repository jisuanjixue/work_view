class AddSlugToWord < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :slug, :string
    add_index :words, :slug, unique: true
  end
end
