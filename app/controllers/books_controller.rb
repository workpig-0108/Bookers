class BooksController < ApplicationController
    def new
  	    @book = Book.new
    end

    def create
    	@books = Book.all
        # ストロングパラメーターを使用
        @book = Book.new(book_params)
        # DBへ保存する
        if @book.save
           flash[:complete] = "Book was successfully created."
        # トップ画面へリダイレクト
        redirect_to book_path(@book)
        else
    	render 'index'
        end
    end

    def edit
    	@book = Book.find(params[:id])
        if @book.save
        flash[:complete] = "Book was successfully created."
    end
    end

    def update
    	@book = Book.find(params[:id])
    	if
            @book.update(book_params)
    	    redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    def show
    	@book = Book.find(params[:id])
    end

    def index
       @books = Book.all
       @book = Book.new
    end

    def destroy
    	book = Book.find(params[:id])
    	book.destroy
    	redirect_to book_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end
