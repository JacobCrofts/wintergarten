class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :runtime
      t.string :genre
      t.integer :year
      t.string :director
      t.text :description

      t.timestamps null: false
    end
  end
end
