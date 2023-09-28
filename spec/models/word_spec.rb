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
require 'rails_helper'

RSpec.describe Word do
  pending "add some examples to (or delete) #{__FILE__}"
end
