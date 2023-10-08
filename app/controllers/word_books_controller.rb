class WordBooksController < ApplicationController
  include Pagy::Backend
  before_action :set_wordbook, only: [:show]

  def index
    @book_all = current_user.word_books.includes(:user, :words).order(created_at: :desc)
    @word_counts = @book_all.map { |book| [book.id, book.words.size] }.to_h
    @mastered_word_counts = @book_all.map { |book| [book.id, book.words.where(status: 1).size] }.to_h
    @pagy, @word_books = pagy(@book_all)
    rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
  end

  def show
    @pagy, @words = pagy(@word_book.words)
    rescue Pagy::OverflowError
    redirect_to word_book_path(page: 1)
  end

  private

  def set_wordbook
    @word_book = current_user.word_books.find(params[:id])
  end
end
