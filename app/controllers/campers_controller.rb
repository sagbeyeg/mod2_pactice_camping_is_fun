class CampersController < ApplicationController
  before_action :set_camper, only: :show
  
  def index
    @campers = Camper.all
  end

  def show
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.create(camper_params)
   if @camper.valid?
      flash[:success] = "Camper successfully created"
      redirect_to camper_path(@camper)
   else
      flash[:error] = "Something went wrong, try again"
      redirect_to "/campers/new"
    end
  end

  private

  def set_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
    params.require(:camper).permit(:name, :age)
  end
end
