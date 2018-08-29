class IndustriesController < ApplicationController

	def show
		@city = City.find(params[:city_id])
		@industry = Industry.find(params[:id])
		@industries = Industry.all
		@jobs = @city.jobs.where("jobs.industry_id = ?", @industry.id).page(params[:page]).per(20)
	end

end