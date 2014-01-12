class DonorsController < ApplicationController
  
  def show
    @donor = Donor.find(params[:id])
  end

  def index
    @messengers = Donor.all
  end
end
