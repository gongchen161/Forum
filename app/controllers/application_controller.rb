class ApplicationController < ActionController::Base
  def confirm_logged_in
    if !session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(users_path)
    end
  end

  def confirm_level
    if session[:level].to_i < 11
      flash[:notice] = "Permission Denied"
      redirect_to("/")
    end
  end

end
