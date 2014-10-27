class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  
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

      if @user.save
        # binding.pry
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
    if
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

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end
    
  def user_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end 

end 


