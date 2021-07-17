class Api::V1::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all, items: params[:count])
    render json: { page: params[:page],
                  items: @students.as_json 
                 }, status: 200
  end

  def create
    @student = Student.new(student_params)
    
    if @student.save
      render json: { id: @student.id }
    else
      render json: { status: 400, message: "Bad request" }
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :cpf, :birthdate, :payment_method)
  end
end
