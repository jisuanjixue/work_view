# == Schema Information
# Schema version: 20230928074423
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
#
# Indexes
#
#  index_words_on_slug  (slug) UNIQUE
#
class Word < ApplicationRecord
  extend FriendlyId
  has_many :word_book_words, dependent: :destroy
  has_many :word_books, through: :word_book_words
  enum status: { unmastered: 0, mastered: 1 }

  has_rich_text :example_sentence

  validates :name, presence: true

  after_initialize :set_default_status, if: :new_record?

  friendly_id :name, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  private

  def set_default_status
    self.status ||= :unmastered
  end
end
