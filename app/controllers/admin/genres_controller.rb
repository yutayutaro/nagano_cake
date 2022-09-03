class Admin::GenresController < ApplicationController
    before_action :authenticate_admin!
    def index
        @genres = Genre.all
    end    
    def create
        genre = Genre.new(genre_params)
        genre.save
        redirect_to '/admin/genres'
    end
    def edit
        @genre = Genre.find(params[:id])
    end
    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to '/admin/genres'
    end
    def genre_params
        params.require(:genre).permit(:name)
    end    
end
