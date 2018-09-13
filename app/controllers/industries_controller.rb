class IndustriesController < ApplicationController

	before_action :params_search

  def params_search
    if params[:key].present?
      redirect_to jobs_path + "?utf8=✓&key=#{params[:key]}&commit=search"
    end
  end

	def show
		@city = City.find(params[:city_id])
		@industry = Industry.find(params[:id])
		@industries = Industry.all
		@jobs = @city.jobs.where("jobs.industry_id = ?", @industry.id).page(params[:page]).per(12)
		@total = @city.jobs.where("jobs.industry_id = ?", @industry.id).count
	end

end