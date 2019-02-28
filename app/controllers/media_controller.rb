class MediaController < ApplicationController
  before_action :set_media, only: %i[show]

  def index
    @media = Medium.all
  end

  def show
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(media_params)
    if @medium.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @medium.destroy
    redirect_to medium_path
  end

  private

  def set_media
    @medium = Medium.find(params[:id])
  end

  def media_params
    params.require(:medium).permit(:photo, :custody_id)
  end
end
