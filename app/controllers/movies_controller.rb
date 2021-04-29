class MoviesController < ApplicationController
    def new
        @list = List.find(params[:list_id])
        @movie = Movie.new()
    end

    def create
        list = params[:list_id]
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to list_path(list)
        else
            render :new
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :overview, :rating, :poster_path)
    end
end
