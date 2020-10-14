class SignupsController < ApplicationController
  before_action :set_camper, only: :show

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.create(signup_params)
    if @signup.valid?
      flash[:success] = "Signup Created Successfully"
      redirect_to camper_path(@signup.camper)
    else
      flash[:error] = "Something Went Wrong, Try Again"
      redirect_to new_signup_path
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:camper_id, :activity_id, :time)
  end
end
