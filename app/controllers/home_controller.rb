class HomeController< ApplicationController

	def index
		@jobs = Job.all.page(params[:page]).per(12)
	end
end