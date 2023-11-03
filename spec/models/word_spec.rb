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
require 'rails_helper'

RSpec.describe Word do
  pending "add some examples to (or delete) #{__FILE__}"
end
