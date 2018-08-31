class CitiesController< ApplicationController

	before_action :params_search

  def params_search
    if params[:key].present?
      redirect_to jobs_path + "?utf8=✓&key=#{params[:key]}&commit=search"
    end
  end

	def show
		@city = City.find(params[:id])
		@industries = Industry.all
		@jobs = @city.jobs.page(params[:page]).per(12)
	end
end