class Student::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  def create
    unless Donor.find_by_email(params[:student][:email])
      super
      else
        flash[:notice] = 'This email is already registered as a donor.'
        redirect_to new_student_registration_path
    end
  end
end
