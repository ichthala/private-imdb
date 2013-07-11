class MoviesController < ApplicationController

  # How best to restrict the range of my_rating to 0-100?
  def up_rating
    movie = Movie.find(params[:id])
    movie.my_rating += 1
    movie.save
    redirect_to("/movies/#{params[:id]}")
  end

  # Not very DRY, could I combine up_rating and down_rating into one action?
  # XXX
  def down_rating
    movie = Movie.find(params[:id])
    movie.my_rating -= 1
    movie.save
    redirect_to("/movies/#{params[:id]}")
  end

  def favorite
    movie = Movie.find(params[:id])
    movie.my_rating = 100
    movie.favorited = true
    movie.save
    redirect_to('/movies')
  end

  def favorite_result
    imdb_movie = Imdb::Movie.new(params[:id])
    movie = Movie.new
    movie.title = imdb_movie.title
    movie.poster = imdb_movie.poster
    movie.year = imdb_movie.year
    movie.plot = imdb_movie.plot
    movie.mpaa_rating = imdb_movie.mpaa_rating
    movie.my_rating = 100
    movie.favorited = true
    imdb_movie.cast_members.map do |cast_member|
      actor = Actor.find_or_create_by_name(name: cast_member)
      movie.actors << actor
    end
    movie.save
    redirect_to('/movies')
  end

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
    imdb_movie.cast_members.map do |cast_member|
      actor = Actor.find_or_create_by_name(name: cast_member)
      movie.actors << actor
    end
    movie.save
    redirect_to('/movies')
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_actor_names = @movie.actors.map { |actor| actor.name }
  end

  def result_show
    @movie = Imdb::Movie.new(params[:id])
    @movie_actor_names = @movie.cast_members
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