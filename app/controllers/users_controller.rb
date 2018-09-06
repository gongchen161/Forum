class UsersController < ApplicationController

  before_action :confirm_logged_in, :except => [:index, :new, :login, :create]

  layout "main"

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(userParams)
    @user.level = 1
    @user.numThreads = 0
    @user.numLikes = 0

    if @user.save
      session[:user_id] = @user.id
      session[:first_name] = @user.first_name
      session[:level] = @user.level
      flash[:notice] = 'User created successfully.'
      redirect_to(subjects_path)
    else
      render('index')
    end

  end

  def login
    if params[:email].present? && params[:password].present?
      foundUser = User.where(:email => params[:email]).first
      if foundUser
        validUser = foundUser.authenticate(params[:password])
      end
    end

    if validUser
      session[:user_id] = validUser.id
      session[:first_name] = validUser.first_name
      session[:level] = validUser.level
      flash[:notice] = "You are now logged in."
      redirect_to("/")
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('index')
    end
  end

  def logout
    session[:user_id] = nil
    session[:first_name] = nil
    session[:level] = nil
    flash[:notice] = 'Logged out'
    redirect_to("/")
  end

  private

 def userParams
   params.require(:user).permit(:first_name, :last_name, :email, :password)
 end
end
