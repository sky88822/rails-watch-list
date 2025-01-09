class BookmarksController < ApplicationController
  before_action :set_list
  before_action :set_movie
  before_action :set_bookmark, only: [:destroy]

  # POST /lists/:list_id/bookmarks
  def create
    @bookmark = @list.bookmarks.new(movie: @movie, comment: params[:comment])
    if @bookmark.save
      redirect_to @list, notice: 'Movie was successfully added to the list.'
    else
      redirect_to @list, alert: 'There was an error adding the movie to the list.'
    end
  end

  # DELETE /bookmarks/:id
  def destroy
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark was successfully removed.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
