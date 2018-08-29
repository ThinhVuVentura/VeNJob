class JobsController < ApplicationController

	def show
		@job = Job.find(params[:id])
		@users = @job.users
	end

	def index
		@jobs = Job.all.page(params[:page]).per(15)
	end
end