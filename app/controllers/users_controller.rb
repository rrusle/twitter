class UsersController < ApplicationController

  def home
    @user = User.new
    redirect_to timeline_path unless @current_user.nil?
  end

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new user_params
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user 
      else
        render :new 
      end

  end 
  
  def edit 
    @user = User.find params[:id]
    @user = @current_user
    redirect_to root_path unless @user.present?
  end 

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to @user
    else
      render :edit 
    end
  end 

  def show
    @user = User.find params[:id]
    @tweet = Tweet.new
  end 

  def destroy
      @user = User.find params[:id]
      @user.destroy
      redirect_to users_url 
  end

  def following
  end

  def followers
  end


  private 
    
  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end 

end 


