class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your email and password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Bye'
  end
end
