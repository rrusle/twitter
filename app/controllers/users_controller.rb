class UsersController < ApplicationController
# before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  
  def home
    @user = User.new
  end

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
   
      # Fix this indentation
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user, notice: 'User was successfully created.' 
      else
        render :new 
      end

  end 
  
  def edit
    @user = User.find(params[:id]) 
    @user = @current_user
    redirect_to root_path unless @user.present?
  end 

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      render :edit 
    end
  end 

  def show
    @user = User.find(params[:id])
  end 

  def destroy
    @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'User was successfully delete.' 
  end



  def following
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end




  # private 

  # def set_user
  #   @user = User.find(params[:id])
  # end
    
  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end 

end 


