class StudentsController < ApplicationController
  def show
    Student.find(params[:id])
  end
end
