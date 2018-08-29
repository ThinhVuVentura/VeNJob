class CitiesController< ApplicationController

	def show
		@city = City.find(params[:id])
		@industries = Industry.all
		@jobs = @city.jobs.page(params[:page]).per(12)
	end
end