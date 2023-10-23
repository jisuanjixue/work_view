class CreateNoteTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :note_types do |t|
      t.string :name, null: false
      t.boolean :show, default: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end

    add_index :note_types, [:name, :note_id], unique: true
    add_index :note_types, :name
  end
end
