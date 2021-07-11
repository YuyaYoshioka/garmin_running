class DistancePagesController < ApplicationController
  def show
    @posts_all_month = current_user.posts.map do |post|
      "#{post.posted_at.year}-#{post.posted_at.month}"
    end.to_set
    @current_month = "#{Date.today.year}-#{Date.today.month}"
  end
end
