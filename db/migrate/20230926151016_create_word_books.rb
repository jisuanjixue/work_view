class CreateWordBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :word_books do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :words_count, null: false, default: 0
      t.timestamps
    end
  end
end
