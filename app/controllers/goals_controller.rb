class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: %i[ show edit update destroy ]

  # GET /goals or /goals.json
  def index
    @goals = Goal.all.order(id: "DESC")
  end

  def mypage
    @goals = current_user.goals.order(id: "DESC")
    @dones = Done.all
  end

  # GET /goals/1 or /goals/1.json
  def show
     @done = current_user.dones.find_by(goal_id: @goal.id)
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals or /goals.json
  def create
    @goal = Goal.create(goal_params)

    respond_to do |format|
      if @goal.save
        #目標をを作成すると同時に自身も参加する
         current_user.follow.create(
          goal_id: @goal.id,
          is_owner: true
        )

        format.html { redirect_to @goal, notice: "目標が作成されました。" }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /goals/:goal_id/join
  def join
    @goals = Goal.all.order(id: "DESC")
    goal = Goal.find(params[:goal_id])
    @follow = current_user.follows.create(goal_id: params[:goal_id],user_id: params[:user_id])
  end

  # PATCH/PUT /goals/1 or /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1 or /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: "Goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:title, :content, :category_id, :deadline)
    end
end
