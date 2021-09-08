class FollowsController < ApplicationController
  def create
    @goal = Goal.find(params[:goal_id])
    if @goal.current_goal?
      @follows = Follow.new
      @follows.user_id = current_user.id
      @follows.is_finished = true
      @follows.save
    end
    flash.now[:notice] = '参加しました！'
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
  end
end
