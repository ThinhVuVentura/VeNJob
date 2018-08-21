class Admins::JobsController < Admins::BaseController

	before_action :set_jobs, only:[:show, :edit, :update, :destroy]

	def index
		@jobs = Job.all.page(params[:page]).per(20)
	end

	def create
		@job = Job.new(params_job)
		if @job.save
			redirect_to admins_job_path(@job)
		else
			render :new,  errors: @job.errors.full_messages.join(", ")
		end
	end

	def update
		if @job.update(params_job)
			redirect_to admins_job_path(@job)
		else
			render :edit,  errors: @job.errors.full_messages.join(", ")
		end
	end

	def destroy
		if @job.destroy
			redirect_to admins_jobs_path
		else
			render :index,  errors: @job.errors.full_messages.join(", ")
		end
	end

	def new
		@job = Job.new()
	end

	private

		def set_jobs
			@job = Job.find(params[:id])
		end

		def params_job
			params.require(:job).permit(:name, :description, :price, :photo, :category_id)
		end

end