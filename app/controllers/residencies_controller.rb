class ResidenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_residency, only: [:show, :edit, :update]

  def index
    @residencies = Residency.all
  end

  def show
  end

  def new
    @residency = Residency.new
  end

  def create
    @residency = Residency.new(residency_params)
    if @residency.save
      redirect_to residencies_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @residency.update(residency_params)
      redirect_to residencies_path
    else
      render :edit
    end
  end

  private

  def residency_params
    params.require(:residencies).permit(:date_start, :date_end, :users_id)
  end

  def set_residency
    @residency = Residency.find(params[:id])
  end

end




