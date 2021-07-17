module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :title, String, null: false
    field :content, String, null: false
    field :distance, Float, null: false
    field :velocity_minute, Integer, null: false
    field :normal_heartbeat, Integer, null: false
    field :max_heartbeat, Integer, null: false
    field :maximal_oxygen_consumption, Float, null: false
    field :lactate_threshold, Float, null: false
    field :body_weight, Integer, null: false
    field :posted_at, GraphQL::Types::ISO8601Date, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :velocity_second, Integer, null: false
  end
end
