class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
