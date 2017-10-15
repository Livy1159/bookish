class CreateBookGenres < ActiveRecord::Migration[5.1]
  def change
  	create_table :book_genres do |t|
  		t.references :book
  		t.references :genre

  		t.timestamps
  	end
  end
end
