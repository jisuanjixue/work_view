# == Schema Information
# Schema version: 20231023065650
#
# Table name: note_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  show       :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint           not null
#
# Indexes
#
#  index_note_types_on_name              (name)
#  index_note_types_on_name_and_note_id  (name,note_id) UNIQUE
#  index_note_types_on_note_id           (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#
require 'rails_helper'

RSpec.describe NoteType do
  pending "add some examples to (or delete) #{__FILE__}"
end
