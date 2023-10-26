# == Schema Information
# Schema version: 20231026075111
#
# Table name: note_items
#
#  id           :bigint           not null, primary key
#  description  :text
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  note_type_id :bigint           not null
#
# Indexes
#
#  index_note_items_on_note_type_id  (note_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_type_id => note_types.id)
#
class NoteItem < ApplicationRecord
  belongs_to :note_type
  delegate :note, to: :note_type
end
