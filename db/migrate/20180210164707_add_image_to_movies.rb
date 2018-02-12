class AddImageToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :avatars, :string
  end
end
