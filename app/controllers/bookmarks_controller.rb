class BookmarksController < ApplicationController
  # def index
  #   @bookmarks = Bookmark.all
  # end

  # def show
  #   @bookmark = Bookmark.find(params[:id])

  #   @movie = Movie.new
  # end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_param)
    @list = List.new
    if @bookmark.save
      redirect_to restaurant_path(@bookmark)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy # DELETE -> redirect
    @bookmark = Bookmark.find(params[:id]) # a commenter avec le before_action
    @bookmark.destroy
  end
  private

  def bookmark_param
    params.require(:bookmark).permit(:title, :overwiew, :poster_url, :rating)
  end
end
