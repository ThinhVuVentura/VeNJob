class UsersController < ApplicationController

	before_action :authenticate_user!

	def update
		if current_user.update(param_user)
  		redirect_to edit_user_path
  	else
  		render :edit
  	end
	end

	def favorite_user
		job = Job.find(params[:format].to_i)
		if current_user.favorited? job
			current_user.remove_favorite job
			redirect_to request.referrer
		else
			current_user.favorite job
			redirect_to request.referrer
		end
	end

	def apply_job
		arr_job_ids = current_user.job_ids
		if arr_job_ids.include? params[:format].to_i
			arr_job_ids.delete(params[:format].to_i)
			current_user.update(job_ids: arr_job_ids)
		else
			arr_job_ids.push(params[:format].to_i)
			current_user.update(job_ids: arr_job_ids)
			ApplyJobMailer.send_mail_add_cv(current_user,Job.find(params[:format].to_i)).deliver_now
		end

		redirect_to request.referrer
	end

	def update_cv
		@user = User.find(params[:id])
		if @user.update(param_cv)
			redirect_to tks_page_path
		else
			render :confimation_job
		end
	end

	def confimation_job
		@job = Job.find(params[:format].to_i)
		@user = User.find(params[:id])
	end

	def show
		@jobs = current_user.favorited_by_type('Job')
	end

	def update_password
		if current_user.valid_password?(params[:user][:old_password])
      if current_user.update_attributes(param_password)
      else
        render :edit
      end
    else
    	render :edit
    end
	end

	private

		def param_user
  		params.require(:user).permit(:name, :phone, :address)
  	end
    def param_password
      params.require(:user).permit(:password,:password_confirmation)
    end

    def param_cv
    	params.require(:user).permit(:cv)
    end

end
