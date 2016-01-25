class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.integer :commenter_id
      t.text    :content
      t.string  :commentable_type


      t.timestamps null: false
    end
  end
end
