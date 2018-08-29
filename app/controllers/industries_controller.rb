class CategoriesController < ApplicationController

	def show
		@city = City.find(params[:city_id])
		@industry = Industry.find(params[:id])
		@industries = @city.industries.order(position: :ASC)
		@jobs = @industry.jobs.page(params[:page]).per(12)
	end

end