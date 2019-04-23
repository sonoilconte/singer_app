class ImagesController < ApplicationController
  def new
  end

  def index
    @images = Image.all
  end

  def show
    @image = Image.find_by(id: params[:image_id])
  end

  def create
    image = Image.create!(image_params)
    redirect_to "/artists/#{params[:id]}/images/#{image.id}"
  end

  private

  def image_params
    params.require(:image).permit(:name, :category, :order, :file, :artist_id)
  end
end
