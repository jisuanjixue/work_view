# == Schema Information
# Schema version: 20231012091020
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  show       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_name              (name)
#  index_categories_on_name_and_note_id  (name,note_id) UNIQUE
#  index_categories_on_note_id           (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#
require 'rails_helper'

RSpec.describe Category do
  pending "add some examples to (or delete) #{__FILE__}"
end
