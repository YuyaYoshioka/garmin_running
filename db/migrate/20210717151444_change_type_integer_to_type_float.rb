class ChangeTypeIntegerToTypeFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :maximal_oxygen_consumption, :float
    change_column :posts, :lactate_threshold, :float
    change_column :posts, :body_weight, :float
    change_column :users, :maximal_oxygen_consumption, :float
    change_column :users, :lactate_threshold, :float
    change_column :users, :body_weight, :float
  end
end
