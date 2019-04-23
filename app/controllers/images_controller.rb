class ImagesController < ApplicationController
  def new
  end

  def index
    @images = Image.all
  end

  def show
    @image = Image.find_by(id: params[:id])
  end

  def create
    Image.create!(image_params)
    redirect_to '/'
  end

  private

  def image_params
    params.require(:artist).permit(:name, :category, :order, :file)
  end
end
