class ChangeColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :velocity, :velocity_minute
    add_column :posts, :velocity_second, :integer, null: false, default: 0
  end
end
