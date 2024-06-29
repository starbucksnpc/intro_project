class BooksController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @books = Book.where('LOWER(title) LIKE ?', query).page(params[:page]).per(10)
    else
      @books = Book.page(params[:page]).per(10)
    end
  end

  def show
    @book = Book.find(params[:id])
  end
end
