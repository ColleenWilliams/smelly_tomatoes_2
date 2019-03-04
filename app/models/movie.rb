class Movie < ApplicationRecord

  validates :title, :rating, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}

  validates :image_file_name, allow_blank: true, format: {
    with: /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }

  has_many :reviews, dependent: :destroy
  belongs_to :director
  mount_uploader :avatar, AvatarUploader
  #serialize :avatars, JSON

  MOVIE_RATINGS= ["G", "PG", "PG-13", "R", "NC-17","NR"];
  LOW_GROSS = 300000;
  HIGH_GROSS = 500000000;
  RECENT_MOVIES = 3

  def self.ratings
    MOVIE_RATINGS
  end

  def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
  end

  def self.hits
    where('total_gross >= ?', LOW_GROSS).order(total_gross: :desc)
  end

  def self.flops
    where('total_gross < ?', HIGH_GROSS).order(total_gross: :asc)
  end

  def self.recently_added
    order('created_at desc').limit(RECENT_MOVIES)
  end

  def flop?
    total_gross.blank? || total_gross < HIGH_GROSS
  end

  def average_stars
    reviews.average(:stars)
  end

  def self.popular
   self.all.sort_by {|m| m.average_stars.to_f }.reverse[0..2]
  end

  def self.order_by_created_at
    order("created_at DESC")
  end


  def self.search(search)
     where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end
end
