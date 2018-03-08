class GoalsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_goal, only: [:show, :edit, :update, :destroy]

	def index
  	end

	def new
		@check = Goal.where(user_id: current_user)

		unless @check.empty?
			redirect_to dashboard_path
		else
			@goal = Goal.new
		end
  	end

	def create
		@goal = current_user.build_goal(goal_params)

		if @goal.save
			update_carbs
			redirect_to dashboard_path
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end
	
    def update
        if @goal.update(goal_params)
			update_carbs
            redirect_to dashboard_path
        else
            render 'edit'
        end
	end

	def destroy
		@goal.destroy
		current_user.calc_recommended_nutrients_per_day
        redirect_to dashboard_path
	end
	
	
	private

	def find_goal
		@goal = Goal.where(user_id: current_user).find(params[:id])
    end

	def goal_params
		params.require(:goal).permit(:user_id, :goal_type)
	end

	def update_carbs
		@user = current_user

		if @goal.goal_type == "Loose weight"
			@recommended_carbohydrates_per_day = @user.recommended_carbohydrates_per_day - (0.2 * @user.recommended_carbohydrates_per_day).round(1)
		elsif @goal.goal_type == "Gain weight"
			@recommended_carbohydrates_per_day = @user.recommended_carbohydrates_per_day + (0.25 * @user.recommended_carbohydrates_per_day).round(1)
		end

		@user.update(recommended_carbohydrates_per_day: @recommended_carbohydrates_per_day)
	end
end
