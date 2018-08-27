class Admins::CategoriesController < Admins::BaseController

	before_action :set_category , only: [:show, :destroy, :edit, :update]

	def index
		@categories = Category.all.page(params[:page]).per(20)
	end

	def show
		@jobs = @category.jobs.page(params[:page]).per(10)
	end

	def create
		@category = Category.new(params_category)
		if @category.save
			redirect_to admins_category_path(@category)
		else
			render :new,  errors: @category.errors.full_messages.join(", ")
		end
	end

	def update
		if @category.update(params_category)
			redirect_to admins_category_path(@category)
		else
			render :edit,  errors: @category.errors.full_messages.join(", ")
		end
	end

	def destroy
		if @category.destroy
			redirect_to admins_categories_path
		else
			render :index,  errors: @category.errors.full_messages.join(", ")
		end
	end

	def new
		@category = Category.new()
	end

	private

		def set_category
			@category = Category.find(params[:id])
		end

		def params_category
			params.require(:category).permit(:title, :position, :city_id)
		end
end
