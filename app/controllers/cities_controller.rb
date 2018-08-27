class CitiesController< ApplicationController

	def show
		@city = City.find(params[:id])
		@categories = @city.categories.order(position: :ASC)
		@jobs = Job.all.page(params[:page]).per(12)
	end
end