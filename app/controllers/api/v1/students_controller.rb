class Api::V1::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all, items: params[:count])
    render json: { page: params[:page],
                  items: @students 
                 }, status: 200
  end

  def create
  end
end
