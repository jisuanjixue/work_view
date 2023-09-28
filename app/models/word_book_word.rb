# == Schema Information
# Schema version: 20230928074423
#
# Table name: word_book_words
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  word_book_id :bigint           not null
#  word_id      :bigint           not null
#
# Indexes
#
#  index_word_book_words_on_word_book_id  (word_book_id)
#  index_word_book_words_on_word_id       (word_id)
#
# Foreign Keys
#
#  fk_rails_...  (word_book_id => word_books.id)
#  fk_rails_...  (word_id => words.id)
#
class WordBookWord < ApplicationRecord
  belongs_to :word
  belongs_to :word_book
end
