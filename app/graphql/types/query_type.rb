module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # First describe the field signature:
    field :current_user_posts_per_month, [PostType], null: true do
      description "Find a posts by User_ID"
      argument :user_id, ID, required: true
      argument :posted_at, String, required: true
    end

    # Then provide an implementation:
    def current_user_posts_per_month(user_id:, posted_at:)
      current_user_posts = Post.where(user_id: user_id)
      create_all_dates_in_month_from_year_and_month(posted_at).map do |date|
        if post = current_user_posts.find_by(posted_at: date)
          post
        else
          Post.new(posted_at: date, distance: 0)
        end
      end
    end

    private

    def create_all_dates_in_month_from_year_and_month(year_and_month)
      DateTime.parse(year_and_month + '-1').all_month
    end
  end
end
