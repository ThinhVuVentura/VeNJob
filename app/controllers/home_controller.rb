class HomeController< ApplicationController

	def index
		@categories = Category.all
		@jobs = Job.all.page(params[:page]).per(12)
	end
end