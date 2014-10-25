class SessionController < ApplicationController
# Login form
  def new
  end

# Where the login form POSTs data
  def create
    user = User.where(:name => params[:name]).first
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      redirect_to login_path
    end
  end

# Logout
  def delete
    session[:user_id] = nil
    redirect_to root_path
  end

end