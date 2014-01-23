class StudentsController < ApplicationController
  # before_filter :authorized?, only: [:show]
  def show
    @student = Student.find(params[:id])
    authorized?
  end

  private
  def authorized?
    begin
      StudentPolicy.new(@student, current_student).authorized?
    rescue ActionController::RoutingError
      render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
    end
  end
end
