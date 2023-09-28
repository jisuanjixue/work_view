# == Schema Information
# Schema version: 20230928074423
#
# Table name: word_books
#
#  id         :bigint           not null, primary key
#  editable   :boolean          default(FALSE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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
  belongs_to :user
  has_many :word_book_words
  has_many :words, through: :word_book_words
end
 
