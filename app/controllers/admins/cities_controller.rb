
class Admins::CitiesController < Admins::BaseController

	before_action :set_city , only: [:show, :destroy, :edit, :update]

	def index
		@cities = City.all.page(params[:page]).per(20)
	end

	def create
		@city = City.new(params_category)
		if @city.save
			redirect_to admins_city_path(@city)
		else
			render :new,  errors: @city.errors.full_messages.join(", ")
		end
	end

	def update
		if @city.update(params_category)
			redirect_to admins_city_path(@city)
		else
			render :edit,  errors: @city.errors.full_messages.join(", ")
		end
	end

	def destroy
		if @city.destroy
			redirect_to admins_cities_path
		else
			render :index,  errors: @city.errors.full_messages.join(", ")
		end
	end

	def new
		@city = City.new()
	end

	private

		def set_city
			@city = City.find(params[:id])
		end

		def params_category
			params.require(:city).permit(:name, :city_list)
		end
end