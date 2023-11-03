# == Schema Information
# Schema version: 20231026075111
#
# Table name: word_books
#
#  id          :bigint           not null, primary key
#  editable    :boolean          default(FALSE)
#  name        :string
#  words_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_word_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class WordBook < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :words, dependent: :destroy, inverse_of: :word_book

  validates :name, presence: true

  normalizes :name, with: -> { _1.squish }

  scope :ordered, -> { order(name: :desc)}
  scope :search, ->(q) {
    where(arel_table[:name].lower.matches("%#{q.downcase}%"))
  }
end
 
