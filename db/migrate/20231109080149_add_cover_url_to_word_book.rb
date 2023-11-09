class AddCoverUrlToWordBook < ActiveRecord::Migration[7.1]
  def change
    add_column :word_books, :cover_url, :string, null: true
  end
end
