class Api::CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    courses = Course.order(created_at: :DESC)
    render json: courses
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def create
    @course = Course.new(course_params)

    render json: @course, status: :created if @course.save
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render json: '"Course deleted successfully"', status: :ok
  end

  private

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :description, :location, :size, :price, :image)
  end
end
