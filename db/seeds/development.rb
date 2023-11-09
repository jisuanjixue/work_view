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
    word_book = bobo.word_books.create(name: "单词本 1", editable: true, words_count: 0, cover_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Qdmi-pfgh3CSup4PqRziTs8NWwnF7BL9BuYJNMsqpA&s" )
    5.times do |y|
      Rails.logger.debug { "创建 word #{y} for book with user #{bobo.email}" }
      bobo.word_books.create(name: "单词本 #{y}", editable: false, words_count: 0, cover_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Qdmi-pfgh3CSup4PqRziTs8NWwnF7BL9BuYJNMsqpA&s")
    end

    5.times do |y|
      word_book.words.create(name: "单词 #{y}", pronunciation: "发音 #{y}", definition: "定义#{y}", example_sentence: "例子 #{y}", status: 0 )
    end
end


elapsed = Benchmark.measure do
  Rails.logger.debug 'Seeding development database...'
  seed_users
  seed_note
  seed_word_books
end

Rails.logger.debug { "Seeded development DB in #{elapsed.real} seconds" }
