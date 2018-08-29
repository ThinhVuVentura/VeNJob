class CitiesController< ApplicationController

	def show
		@city = City.find(params[:id])
		@industries = @city.industries.order(position: :ASC)
		@jobs = Job.joins(:industry).where("industries.city_id = ?", @city.id).page(params[:page]).per(12)
	end
end