class ApplyJobMailer < ApplicationMailer
	def send_mail_add_cv(user, job)
		@user = user
		@job = job
		mail(:to => user.email, :subject => "confirmation apply job #{job.name}")
	end
end