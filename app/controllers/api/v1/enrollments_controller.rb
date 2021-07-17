class Api::V1::EnrollmentsController < ApplicationController
  def index
    @pagy, @enrollments = pagy(Enrollment.all, items: params[:count])
    render json: { page: params[:page],
                  items: @enrollments.as_json 
                 }, status: 200
  end

  def create
    bills = build_bills(params[:amount], params[:installments], params[:due_day])
    @enrollment = Enrollment.new(amount: enrollment_params[:amount],
                                installments: enrollment_params[:installments],
                                due_day: enrollment_params[:due_day],
                                bills_attributes: bills
                                )
    @enrollment.student = Student.find(enrollment_params[:student_id])
    if @enrollment.save
      render json: @enrollment, status: 200
    else
      render json: {status: 400, message: "Bad request"}
    end
  end

  private
  def render_enrollment
    render json: @enrollment.as_json
  end

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :amount, :installments, :due_day, bills_attributes: [:amount, :installments, :due_date])
  end

  def build_bills(total, installments, due_day)
    first_month = due_day < Date.today.day ? Date.today.month + 1 : Date.today.month
    due_date = DateTime.new(Date.today.year, first_month, due_day)
    bills = []
    (1..installments).each do
      bills << {
        status: "open",
        amount: total / installments,
        due_date: due_date
      }
      current_month = due_date.month
      next_month = current_month + 1
      due_date = DateTime.new(Date.today.year, next_month, due_day)
    end
    bills
  end
end
