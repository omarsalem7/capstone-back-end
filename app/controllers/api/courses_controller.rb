class Api::CoursesController < ApplicationController
  def index
    courses = Course.order(created_at: :DESC)
    render json: courses
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    render json: '"Course deleted successfully"', status: :ok
  end
end
