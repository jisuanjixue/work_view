class WordBooksController < ApplicationController
  include Pagy::Backend
  before_action :set_wordbook, only: [:show]

  def index
    @book_all = WordBook.all.includes(:user).order(created_at: :desc)
    @pagy, @word_books = pagy(@book_all)
    rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
  end

  def show
    @words = @word_book.words
  end

  private

  def set_wordbook
    @word_book = WordBook.find(params[:id])
  end
end
