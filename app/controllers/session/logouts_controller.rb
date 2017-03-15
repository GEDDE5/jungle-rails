class Session::LogoutsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end