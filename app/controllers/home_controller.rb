class HomeController< ApplicationController

	def index
		@cities = City.filter(params).page(params[:page]).per(12)
		@industries = Industry.all
		@jobs = Job.all.order(id: :DESC).limit(9)
	end
end