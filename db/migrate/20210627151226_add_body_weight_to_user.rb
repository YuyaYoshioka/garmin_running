class AddBodyWeightToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :body_weight, :integer, null: false, default: 0
  end
end
