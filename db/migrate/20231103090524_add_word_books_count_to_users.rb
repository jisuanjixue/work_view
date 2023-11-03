class AddWordBooksCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :word_books_count, :integer
  end
end
