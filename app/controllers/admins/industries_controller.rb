class Admins::IndustriesController < Admins::BaseController

  before_action :set_category , only: [:show, :destroy, :edit, :update]

  def index
    @industries = Industry.page(params[:page]).per(20)
  end

  def show
    @jobs = @industry.jobs.page(params[:page]).per(10)
  end

  def create
    @industry = Industry.new(params_industry)
    if @industry.save
      redirect_to admins_industry_path(@industry)
    else
      render :new,  errors: @industry.errors.full_messages.join(", ")
    end
  end

  def update
    if @industry.update(params_industry)
      redirect_to admins_industry_path(@industry)
    else
      render :edit,  errors: @industry.errors.full_messages.join(", ")
    end
  end

  def destroy
    if @industry.destroy
      redirect_to admins_industries_path
    else
      render :index,  errors: @industry.errors.full_messages.join(", ")
    end
  end

  def new
    @industry = Industry.new()
  end

  private

    def set_category
      @industry = Industry.find(params[:id])
    end

    def params_industry
      params.require(:industry).permit(:title, :position, :city_id)
    end
end
