class AddImageToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :avatar, :string
  end
end
