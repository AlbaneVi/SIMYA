class CustodiesController < ApplicationController
  before_action :set_custodies, only: %i[show edit update]

  def index
    @custodies = Custody.all
    @custodies2 = []
    @custodies2 << @custodies.find_by(day_on: Date.parse("Monday"))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 1))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 2))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 3))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 4))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 5))
    @custodies2 << @custodies.find_by(day_on: (Date.parse("Monday") + 6))
  end

  def show
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
