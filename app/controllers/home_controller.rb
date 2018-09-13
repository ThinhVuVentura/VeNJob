class HomeController< ApplicationController

	before_action :params_search

  def params_search
    if params[:key].present?
      redirect_to jobs_path + "?utf8=✓&key=#{params[:key]}&commit=search"
    end
  end

	def index
		@cities = City.filter(params).page(params[:page]).per(12)
		@industries = Industry.all
		@jobs = Job.all.order(id: :DESC).limit(9)
	end
end