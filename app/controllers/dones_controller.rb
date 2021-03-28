class DonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal

  def create
    @done = Done.new(user_id: current_user.id, goal_id: params[:goal_id])
    p "####################"
    p current_user.id
    p goal_id
    p @done
    if @done.save
      redirect_to mypage_url, notice: "doneしました"
    else
      redirect_to mypage_url, notice: "失敗しました"
    end
  end

  def destroy
    @done = current_user.dones.find_by(goal_id: params[:goal_id]).destroy
    redirect_to mypage_url, notice: "done解除しました"
  end

  private
  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end
