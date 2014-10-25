class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)

   
      if @user.save
        redirect_to @user, notice: 'User was successfully created.' 
      else
        render :new 
      end

  end 
  
  def edit 
    @user = @current_user
    redirect_to root_path unless @user.present?
  end 

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.' 
      else
        render :edit 
      end
  end 

  def show
  end 

  def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully delete.' 
    
  end

private 

def set_user
      @user = User.find(params[:id])
    end
    
def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end 


end
