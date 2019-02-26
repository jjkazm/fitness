class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update, :show, :destroy]
  def index
    @exercises = current_user.exercises.where('workout_date > ?', 7.days.ago)
  end

  def show
  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user = current_user
    if @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Exercise has not been updated"
      render :edit
    end
  end

  def destroy
    if @exercise.destroy
      flash[:success] = "Exercise has been deleted."
      redirect_to user_exercises_path(current_user)
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end
end
