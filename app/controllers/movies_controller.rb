class MoviesController < ApplicationController

  def index
  @movies = Movie.all
  if params[:search]
    @movies = Movie.search(params[:search]).order_by_created_at
  else
    @movies = Movie.order_by_created_at
  end
end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie
    else
    render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_url
  end

  def popular
    @movies = Movie.popular
  end

  private

  def movie_params
    params.require(:movie).
      permit(:title, :description, :rating, :released_on, :total_gross, :cast, :duration, :image_file_name, :avatar, :term)
  end
end
