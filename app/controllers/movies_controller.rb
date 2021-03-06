class MoviesController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all.order("title")
    
    if params[:search].present?
      @movies = @movies.search(params[:search])
    end

    case params[:duration]
    when '1' 
      @movies = @movies.where(["movies.runtime_in_minutes < ?", 90])
    when '2'
      @movies = @movies.where(["movies.runtime_in_minutes >= ? AND movies.runtime_in_minutes <= ?", 90, 120])
    when '3'
      @movies = @movies.where(["movies.runtime_in_minutes > ?", 120])
    end

  end

  def show
  end

  def new
    @movie = Movie.new 
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end
   
  def update
    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  
    def movie_params
      params.require(:movie).permit(
        :title, :release_date, :director, :runtime_in_minutes, :description, :poster
      )
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end

end
