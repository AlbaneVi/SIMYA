class CustodiesController < ApplicationController
  before_action :set_custodies, only: %i[show edit update]

  def index
    params[:number] ||= 0
    @lundicourant = Date.parse("Monday").to_time
    @startdate = @lundicourant + (7 * params[:number].to_i).day
    @enddate = @startdate + 6.day
    @custodies = Custody.where(day_on: @startdate..@enddate)
  end

  def show
    @custody = Custody.find(params[:id])
    @media = @custody.media

  end

  def new
    @custody = Custody.new
  end

  def create
    @custody = Custody.new(custodies_params)
    if @custody.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @day_on = @custody.day_on
  end

  def update
    @custody.update(custodies_params)
    redirect_to custody_path
  end

  private

  def set_custodies
    @custody = Custody.find(params[:id])
  end

  def custodies_params
    params.require(:custody).permit(:title, :text, :day_on, :user)
  end

end
