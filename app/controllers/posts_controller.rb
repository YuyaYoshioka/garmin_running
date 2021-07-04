class PostsController < ApplicationController
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(posts_params)
    if @post.save
      flash[:success] = ['投稿しました']
      redirect_to root_path
    else
      flash.now[:alert] = @post.errors.full_messages
      render :new
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :distance, :velocity_minute, :velocity_second, :normal_heartbeat, :max_heartbeat,
                                 :maximal_oxygen_consumption, :lactate_threshold, :body_weight, :posted_at)
  end
end
