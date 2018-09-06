class ApplicationController < ActionController::Base
  def confirm_logged_in
    if !session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(users_path)
    end
  end
end
