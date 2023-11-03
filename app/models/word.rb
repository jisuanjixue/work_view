# == Schema Information
# Schema version: 20231026075111
#
# Table name: words
#
#  id               :bigint           not null, primary key
#  definition       :text
#  example_sentence :text
#  name             :string
#  pronunciation    :string
#  slug             :string
#  status           :integer          default("unmastered")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  word_book_id     :bigint           not null
#
# Indexes
#
#  index_words_on_slug          (slug) UNIQUE
#  index_words_on_word_book_id  (word_book_id)
#
# Foreign Keys
#
#  fk_rails_...  (word_book_id => word_books.id)
#
class Word < ApplicationRecord
  extend FriendlyId
  belongs_to :word_book, counter_cache: true
  enum status: { unmastered: 0, mastered: 1 }

  has_rich_text :example_sentence

  validates :name, presence: true
  normalizes :name, with: -> { _1.squish }

  after_initialize :set_default_status, if: :new_record?

  friendly_id :name, use: %i[slugged history finders]

  after_create do
    User.increment_counter(:words_count, word_book.word_book_id)
  end

  after_destroy do
    User.decrement_counter(:words_count, word_book.word_book_id)
  end

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  private

  def set_default_status
    self.status ||= :unmastered
  end
end
