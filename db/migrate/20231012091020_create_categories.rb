class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :show
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
    add_index :categories, [:name, :note_id], unique: true
    add_index :categories, :name
  end
end
