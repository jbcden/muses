class StudentApplicationsController < ApplicationController
  include Wicked::Wizard
  
  steps :basics, :financial_info, :student_info, :almost, :end

  def new
    @application = StudentApplication.new
  end

  def create
    @application = StudentApplication.new(params[:student_application])
    @application.student_id = current_student.id
    if @application.save
      session[:app_id] = @application.id
      redirect_to student_applications_path
    else
      render :new
    end
  end

  def show
    @application = StudentApplication.find(session[:app_id])
    render_wizard
  end

  def update
    @application = StudentApplication.find(session[:app_id])
    @application.attributes = params[:student_application]
    render_wizard @application
  end

  def redirect_to_finish_wizard
    redirect_to current_student, :notice => 'Thank you for submitting your application.'
  end
end
