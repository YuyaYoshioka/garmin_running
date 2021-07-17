class ChangeTypeOfDistanceInPost < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :distance, :float
  end
end
