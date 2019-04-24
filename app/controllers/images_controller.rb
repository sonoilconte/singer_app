class ImagesController < ApplicationController
  def new
    current_user
  end

  def index
    current_user
    @images = Image.where(artist_id: params[:id])
  end

  def show
    current_user
    @image = Image.find_by(id: params[:image_id])
  end

  def create
    current_user
    image = Image.create!(image_params)
    redirect_to "/artists/#{params[:id]}/images/#{image.id}"
  end

  def edit
    current_user
    @image = Image.find_by(id: params[:image_id])
  end

  def update
    image = Image.find_by(id: params[:image_id])
    if image.update_attributes(image_params)
      flash[:notice] = "Image info saved"
    end
    redirect_to "/artists/#{params[:id]}/images/#{params[:image_id]}/edit"
  end

  def delete
    Image.delete(params[:image_id])
    redirect_to "/artists/#{params[:id]}/images/"
  end

  private

  def image_params
    params.require(:image).permit(:name, :category, :order, :file, :artist_id)
  end
end
