class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@projectmuses.com"

  def comment_submission(comment)
    @comment = comment
    mail(:to => comment.email, :bcc => 'no-reply@projectmuses.com', :subject => 'Your comment has been received')
  end
end
