class BookStatusesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:key] == "check_book"
      @book_statuses = @user.book_statuses.where(status: "check")
      @title = "気になる"
    elsif params[:key] == "read_book"
      @book_statuses = @user.book_statuses.where(status: "read")
      @title = "読んでいる"
    elsif params[:key] == "finish_book"
      @book_statuses = @user.book_statuses.where(status: "finish")
      @title = "読み終わった"
    end

  end

  def create
    book = Book.find(params[:book_id])
    book_status = current_user.book_statuses.new(book_id: book.id)
    if params[:key] == "check"
      book_status.status = 0
    elsif params[:key] == "read"
      book_status.status = 1
    elsif params[:key] == "finish"
      book_status.status = 2
    end
    book_status.save
    redirect_back(fallback_location: root_path)
  end

  def update
    book_status = current_user.book_statuses.find(params[:id])
    if params[:key] == "check"
      book_status.status = 0
    elsif params[:key] == "read"
      book_status.status = 1
    elsif params[:key] == "finish"
      book_status.status = 2
    end
    book_status.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book_status = current_user.book_statuses.find(params[:id])
    book_status.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def book_status_params
    params.require(:book_status).permit(:status)
  end
end
