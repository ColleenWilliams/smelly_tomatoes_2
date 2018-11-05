class ReviewsController < ApplicationController

  before_action :set_event
  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
    @user = current_user
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_reviews_path(@movie)
    else
      render :new
    end

  end

  private

    def review_params
      params.require(:review).permit(:stars,:comment)
    end

    def set_event
      @movie = Movie.find(params[:movie_id])
    end

end
