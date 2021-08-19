class BooksController < ApplicationController
  protect_from_forgery
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book =  Book.find(params[:id])
  end

  def new
     @books = Book.new
  end
  
  def create
     @book = Book.new(book_params)
     if @book.save
      redirect_to book_path(@book), notice: 'successfully'
     else
      flash.now[:alert] = 'error'
      @books = Book.all
      render :index
     end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        redirect_to book_path(@book), notice: 'successfully'
    else
      flash.now[:alert] = 'error'
       @books = Book.all
       render :show
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end