class DistancePagesController < ApplicationController
  def show
    selected_month = Date.today.all_month
    @distance_per_month = selected_month.map do |month|
      [month, current_user.posts.find_by(posted_at: month)&.distance]
    end
  end
end
