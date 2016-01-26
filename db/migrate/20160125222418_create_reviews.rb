class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :film_id, index: true
      t.integer :reviewer_id, index: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
