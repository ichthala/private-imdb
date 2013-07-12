module MoviesHelper

  def buttons
    if @movie.is_a? Imdb::Movie
      render 'save_and_fave'
    else
      render 'fave_and_delete'
    end
  end

end