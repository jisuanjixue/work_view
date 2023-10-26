# == Schema Information
# Schema version: 20231009034628
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Note < ApplicationRecord
  belongs_to :user, class_name: "User"
  validates :name, presence: true
  has_many :note_types,  dependent: :destroy
  has_many :note_items, through: :note_types

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(note) { [ note.user, 'notes'] }, inserts_by: :prepend
end
