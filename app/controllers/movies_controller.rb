class MoviesController < ApplicationController

  def search
    @movies = Imdb::Search.new(params[:search_term]).movies
    render "search_results"
  end

  def index
    @movies = Movie.all
  end

  def new
  end

  def create
    imdb_movie = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = imdb_movie.title
    movie.poster = imdb_movie.poster
    movie.year = imdb_movie.year
    movie.plot = imdb_movie.plot
    movie.mpaa_rating = imdb_movie.mpaa_rating
    movie.my_rating = 50
    movie.save
    redirect_to('/movies')
  end

  def show
    movie_ids = Movie.pluck(:id)
    # binding.pry
    if movie_ids.include?(params[:id].to_i)
      @movie = Movie.find(params[:id])
    else
      @movie = Imdb::Movie.new(params[:id])
    end
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