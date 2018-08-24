class Admins::UsersController < Admins::BaseController

	def import
		 DataUser::ImportData.new().import(params[:file])
    # Randd::Field.create(params[:randd_field]['file'])
    redirect_to action: "index", notice: "Data imported"
	end

end