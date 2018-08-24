class HomeController< ApplicationController

	def index
		@categories = Category.all.order(position: :ASC)
		@jobs = Job.all.page(params[:page]).per(12)
	end
end