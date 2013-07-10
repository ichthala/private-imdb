class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.text :poster
      t.string :year
      t.text :plot
      t.string :mpaa_rating
      t.integer :my_rating
      t.boolean :favorited, default: false
      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
