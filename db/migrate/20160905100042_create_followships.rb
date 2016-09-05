class CreateFollowships < ActiveRecord::Migration
  def change
    create_table :followships do |t|
      t.integer :followed_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
