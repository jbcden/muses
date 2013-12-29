require_relative '../data/comment'
class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
  end
  def contact_us
  end
  def submit_comment
    @comment = Comment.new(params)
    ApplicationMailer.comment_submission(@comment).deliver
    render 'contact_us'
  end
end
