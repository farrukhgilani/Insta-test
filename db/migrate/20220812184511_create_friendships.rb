class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :follower_id
      t.references :following_id
      t.timestamps
    end
  end
end
