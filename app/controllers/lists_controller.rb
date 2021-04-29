class ListsController < ApplicationController
    def index
        @lists = List.all
    end

    def show
        list_id = params[:id]
        @list = List.find(list_id)
        @bookmarks = Bookmark.where(list_id: list_id)
        @movies = find_movies(@bookmarks)
        @review = Review.new(list_id: list_id)
        @reviews = Review.where(list_id: list_id)
    end

    def create
        @list = List.new(list_params)
        if @list.save
            redirect_to lists_path
        else
            render :new
        end
    end

    def new
        @list = List.new()
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
            movies << Movie.find(bookmarks[:movie_id])
        end
        return movies
    end

    def list_params
        params.require(:list).permit(:name, :url_path)
    end
end
