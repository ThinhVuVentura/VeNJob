class ApplicationController < ActionController::Base

  before_action :stop_page

	protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :notice => 'if you want to add a notice'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def stop_page
    redirect_to "/404"
  end
end
