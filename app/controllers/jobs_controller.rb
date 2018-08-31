class JobsController < ApplicationController


	def show
		if params[:key].present?
      redirect_to jobs_path + "?utf8=✓&key=#{params[:key]}&commit=search"
    end
		@job = Job.find(params[:id])
		@users = @job.users
	end

	def index
		@jobs = Job.search(params)
		@jobs = Kaminari.paginate_array(@jobs, total_count: @jobs.count)
                                    .page(params[:page])
                                    .per(12)
	end
end