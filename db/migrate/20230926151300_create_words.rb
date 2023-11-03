class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :name
      t.string :pronunciation
      t.text :definition
      t.text :example_sentence
      t.references :word_book, foreign_key: true, null: false
      t.timestamps
    end
  end
end
