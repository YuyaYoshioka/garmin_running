class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }
  validates :content, presence: true
  validates :distance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :velocity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :normal_heartbeat, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :max_heartbeat, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :maximal_oxygen_consumption, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :lactate_threshold, presence: true, numericality: { greater_than_or_equal_to: 0}
  validates :body_weight, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :posted_at, presence: true
end