class CreateNoteItems < ActiveRecord::Migration[7.0]
  def change
    create_table :note_items do |t|
      t.string :title
      t.text :description
      t.references :note_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
