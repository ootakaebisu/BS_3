class ResponsesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    book_response = current_user.responses.new(response_params)
    book_response.book_id = book.id
    book_response.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    book_response = book.responses.find(params[:id])
    book_response.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def response_params
    params.require(:response).permit(:text)
  end
end




