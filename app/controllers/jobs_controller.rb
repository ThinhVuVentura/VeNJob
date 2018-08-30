class JobsController < ApplicationController

	def show
		@job = Job.find(params[:id])
		@users = @job.users
	end

	def index
		@jobs = Job.search(params)
	end
end