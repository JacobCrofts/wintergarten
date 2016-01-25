class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rateable_id
      t.integer :rater_id
      t.string :rateable_type
      t.integer :value

      t.timestamps null: false
    end
  end
end
