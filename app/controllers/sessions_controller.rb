class SessionsController < ApplicationController
  def sign_in
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Successfully signed in!"
        redirect_to root_path
      else
        flash[:alert] = "Username and password did not match any records"
        render :sign_in
      end
    else
      flash[:alert] = "Username and password did not match any records"
      render :sign_in
    end
  end 

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to root_path
  end

  def sign_out
  end
end
