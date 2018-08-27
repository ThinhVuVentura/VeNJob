class ApplyJobMailer < ApplicationMailer
	def send_mail_add_cv(user, job)
		@user = user
		@job = job
		mail(:to => user.email, :subject => "confirmation apply job #{job.name}")
	end

	def done_apply_user(user,job)
		@user = user
		@job = job
		mail(:to => user.email, :subject => "apply success #{job.name}")
	end

	def mailer_admin(user,job)
		@user = user
		@job = job
		email = "admin@admin.com"
		mail(:to => email, :subject => "new apply job")
	end
end