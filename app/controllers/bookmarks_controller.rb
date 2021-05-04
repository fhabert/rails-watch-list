class BookmarksController < ApplicationController
    def new
        @list = List.find(params[:list_id])
        @bookmark = Bookmark.new()
        bookmarks = Bookmark.all
        bookmarks_id = []
        bookmarks.each do |bookmark|
            bookmarks_id << bookmark.movie_id
        end
        movies = Movie.all
        @movies = []
        movies.each do |movie|
            if !bookmarks_id.include?(movie.id)
                @movies << movie.title
            end
        end
    end

    def create
        list = params[:list_id]
        content = bookmark_params()
        movie = Movie.where(title: content['movie_id'])
        movie_id = movie[0].id
        infos = { movie_id: movie_id, comment: content['comment'] }
        @bookmark = Bookmark.new(infos)
        @bookmark.list_id = list
        if @bookmark.save
            redirect_to list_path(list)
        else
            render :new
        end
    end

    private

    def bookmark_params
        params.require(:bookmark).permit(:movie_id, :comment)
    end
end
