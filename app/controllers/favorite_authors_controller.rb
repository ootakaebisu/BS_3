class FavoriteAuthorsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorite_authors = @user.favorite_authors
  end

  def create
    author = Author.find(params[:author_id])
    favorite_author = current_user.favorite_authors.new(author_id: author.id)
    favorite_author.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    author = Author.find(params[:author_id])
    favorite_author = current_user.favorite_authors.find_by(author_id: author.id)
    favorite_author.destroy
    redirect_back(fallback_location: root_path)
  end
end
