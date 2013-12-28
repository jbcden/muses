require_relative '../../lib/exceptions'
class StudentsController < ApplicationController
  def show
    @student = Student.find(params[:id])
    raise Exceptions::NotAuthorizedError unless StudentPolicy.new(@student, current_student).authorized?
  end
end
