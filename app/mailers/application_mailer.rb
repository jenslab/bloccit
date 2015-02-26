class ApplicationMailer < ActionMailer::Base
  default from: "palacios.jennifer@gmail.com"
  layout 'mailer'

   def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
     headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
     headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
