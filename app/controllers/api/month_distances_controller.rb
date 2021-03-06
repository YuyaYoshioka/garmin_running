module Api
  class MonthDistancesController < ActionController::API
    # GET /month_datas?month=params[:month]
    def show
      query_string = "
      {
        currentUserPostsPerMonth(userId: #{current_user.id}, postedAt: #{params[:month]}) {
          distance
          postedAt
        }
      }"
      result_hash = GarminRunningSchema.execute(query_string)
      render json: result_hash
    end
  end
end
