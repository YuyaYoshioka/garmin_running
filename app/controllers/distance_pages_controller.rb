class DistancePagesController < ApplicationController
  def show
    selected_month = Date.today.all_month
    @distance_per_month = selected_month.map do |month|
      [month, current_user.posts.find_by(posted_at: month)&.distance]
    end
    @posts_all_month = current_user.posts.map do |post|
      "#{post.posted_at.year}-#{post.posted_at.month}"
    end.to_set
    @current_month = "#{Date.today.year}-#{Date.today.month}"
  end
end
