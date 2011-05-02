class OsMailer < ActionMailer::Base
  default :from => "tordek.coast@gmail.com"

	def mandar(email)
		mail(:to => email, :subject => "teste", :body => "<p>teste do <b>email</b></p>")
	end
end
