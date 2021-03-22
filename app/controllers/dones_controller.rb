class DonesController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def create
    done = current_user.dones.create(goal_id: params[:goal_id])
    redirect_to mypage_url, notice: "doneしました"
  end

  def destroy
    done = current_user.dones.find_by(goal_id: params[:goal_id]).destroy
    redirect_to mypage_url, notice: "done解除しました"
  end
end
