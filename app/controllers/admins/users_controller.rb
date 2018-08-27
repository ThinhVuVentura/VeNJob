class Admins::UsersController < Admins::BaseController

	before_action :set_user, only:[:show, :edit, :update, :destroy]

	def import
		 DataUser::ImportData.new().import(params[:file])
    # Randd::Field.create(params[:randd_field]['file'])
    redirect_to action: "index", notice: "Data imported"
	end

	def index
		@users = User.all.page(params[:page]).per(20)
	end

	def create
		@user = User.new(params_user)
		@user.skip_confirmation!
		if @user.save
			redirect_to admins_user_path(@user)
		else
			render :new,  errors: @user.errors.full_messages.join(", ")
		end
	end

	def update
		if @user.update(params_user)
			redirect_to admins_user_path(@user)
		else
			render :edit,  errors: @job.errors.full_messages.join(", ")
		end
	end

	def destroy
		if @user.destroy
			redirect_to admins_users_path
		else
			render :index,  errors: @user.errors.full_messages.join(", ")
		end
	end

	def new
		@user = User.new()
	end

	private

		def set_user
			@user = User.find(params[:id])
		end

		def params_user
			if params[:user][:password] == ""
				params.require(:user).permit(:name, :phone, :address, :email, :cv)
			else
				params.require(:user).permit(:name, :phone, :address, :email,:cv, :password)
			end
		end
end