class HomeController< ApplicationController

	def index
		@cities = City.filter(params).page(params[:page]).per(12)
		@industries = Industry.all.order(position: :ASC)
		@jobs = Job.order(created_at: :DESC).limit(12)
	end
end