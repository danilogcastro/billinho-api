class Api::V1::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all, items: params[:count])
    render json: { page: params[:page],
                  items: @students.as_json 
                 }, status: 200
  end

  def create
  end

  private
  def student_params
    params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
  end
end
