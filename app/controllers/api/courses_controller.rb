class Api::CoursesController < ApplicationController
  def index
    courses = Course.order(created_at: :DESC)
    render json: courses
  end
end
