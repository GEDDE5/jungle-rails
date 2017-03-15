class Session::LoginsController < ApplicationController
  def show
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root, notice: 'Logged in successfully'
    else
      redirect_to :show, notice: "Login unsuccessful"
    end
  end

end
