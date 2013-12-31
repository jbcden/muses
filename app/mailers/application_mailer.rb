class ApplicationMailer < ActionMailer::Base
  default from: "mmusetest@gmail.com"

  def comment_submission(comment)
    @comment = comment
    mail(:to => comment.email, :bcc => 'mmusetest@gmail.com', :subject => 'Your comment has been received')
  end
end
