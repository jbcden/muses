class Donor::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end
  def create
    unless Student.find_by_email(params[:donor][:email])
      super
    else
      flash[:notice] = 'This email is already registered as a student.'
      redirect_to new_donor_registration_path
    end
  end
end
