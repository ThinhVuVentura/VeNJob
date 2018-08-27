class CategoriesController < ApplicationController

	def show
		@city = City.find(params[:city_id])
		@category = Category.find(params[:id])
		@categories = @city.categories.order(position: :ASC)
		@jobs = @category.jobs.page(params[:page]).per(12)
	end

end