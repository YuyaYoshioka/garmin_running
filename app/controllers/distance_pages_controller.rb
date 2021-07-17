class DistancePagesController < ApplicationController
  def show
    @posts_all_month = current_user.posts.map do |post|
      "#{post.posted_at.year}-#{post.posted_at.month}"
    end.to_set.sort
    @current_month = @posts_all_month.last
  end
end
