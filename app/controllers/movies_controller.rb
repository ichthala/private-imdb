class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
  end

  def create
    movie = Movie.new()
    movie.name = params[:name]
    movie.save
    redirect_to('/movies')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.name = params[:name]
    movie.save
    redirect_to "/movies/#{movie.id}"
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to('/movies')
  end

end