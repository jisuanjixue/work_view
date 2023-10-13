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
class Category < ApplicationRecord
  belongs_to :note
  validates :name, presence: true, uniqueness: { scope: :note_id }

  scope :ordered, -> {order(date: :desc)}
end
