class ListsController < ApplicationController
    def index
        @lists = List.all
    end

    def show
        list_id = params[:id]
        @list = List.find(list_id)
        @bookmarks = Bookmark.where(list_id: list_id)
        @movies = find_movies(@bookmarks)
        @movie_count = @movies.length
        @review = Review.new(list_id: list_id)
        @reviews = Review.where(list_id: list_id)
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to root_path
        else
            render :new
        end
    end

    def new
        @list = List.new()
    end

    def destroy
        movie = params[:id]
        movie_del = Movie.find(movie)
        movie_del.destroy
    end

    private

    def find_movies(bookmarks)
        movies_ids = []
        movies = []
        if bookmarks.count > 1
            bookmarks.each do |bookmark|
                movies_ids << bookmark[:movie_id]
            end
            movies_ids.each do |id|
                movies << Movie.find(id)
            end 
        else 
            movies << Movie.find(bookmarks[0][:movie_id])
        end
        return movies
    end

    def list_params
        params.require(:list).permit(:name, :url_path, :photo)
    end
end
