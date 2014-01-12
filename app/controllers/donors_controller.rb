class DonorsController < ApplicationController
  
  def show
    @donor = Donor.find(params[:id])
  end

  def index
    @donors = Donor.all
  end
end
