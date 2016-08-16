class RemoveFielposterImageUrlFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :poster_image_url, :string
  end
end
