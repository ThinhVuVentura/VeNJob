class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@categories = Category.all
		@jobs = @category.jobs.page(params[:page]).per(12)
	end

end