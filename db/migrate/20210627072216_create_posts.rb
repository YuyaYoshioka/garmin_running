class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user
      t.string :title, null: false
      t.text :content, null: false
      t.integer :distance, null: false, default: 0
      t.integer :velocity, null: false, default: 0
      t.integer :normal_heartbeat, null: false
      t.integer :max_heartbeat, null: false
      t.integer :maximal_oxygen_consumption, null: false
      t.integer :lactate_threshold, null: false
      t.integer :body_weight, null: false
      t.date :posted_at, null: false

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
