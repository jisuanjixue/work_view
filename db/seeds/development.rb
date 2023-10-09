# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

def seed_users
  User.create!(email: 'aa111@example.com',
                     password: '123456',
                     password_confirmation: '123456',
                     username: "aa111")

  User.create!(email: 'ss111@doe.com',
                     password: '123456',
                     password_confirmation: '123456',
                     username: "ss111",
                     )
end

def seed_note
  bobo =  User.first
  john = User.second
  20.times do |x|
    Note.create!(name: "笔记 #{x}", user: bobo)
  end
end

def seed_word_books
  bobo =  User.first
  john = User.second

    Rails.logger.debug { "创建  word_book" }
    WordBook.create!(name: "单词本 1", editable: true, user: bobo)
    WordBook.create!(name: "单词本 2", editable: false, user: bobo)
    WordBook.create!(name: "单词本 3", editable: false, user: bobo)
    WordBook.create!(name: "单词本 4", editable: false, user: bobo)
    WordBook.create!(name: "单词本 5", editable: false, user: bobo)

    5.times do |y|
      Rails.logger.debug { "创建 word #{y} for book with user #{bobo.email}" }
      Word.create(name: "单词 #{y}", pronunciation: "发音 #{y}", definition: "定义#{y}", example_sentence: "例子 #{y}", status: 0 )
    end

    5.times do |x|
      Rails.logger.debug { "创建 word_book_word #{x} 关联 book 和word_book with user #{bobo.email}" }
      WordBookWord.create(word_id: x, word_book_id: x)
    end
end


elapsed = Benchmark.measure do
  Rails.logger.debug 'Seeding development database...'
  seed_users
  seed_note
  seed_word_books
end

Rails.logger.debug { "Seeded development DB in #{elapsed.real} seconds" }
