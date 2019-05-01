class ImagesController < ApplicationController

  def index
    redirect_unauthorized_user(current_user, params[:id])
    @images = Image.where(artist_id: params[:id])
  end

  def show
    redirect_unauthorized_user(current_user, params[:id])
    @image = Image.find_by(id: params[:image_id])
  end

  def new
    redirect_unauthorized_user(current_user, params[:id])
    category_options
    order_integer_range
  end

  def create
    redirect_unauthorized_user(current_user, params[:id])
    image = Image.create!(image_params)
    redirect_to "/artists/#{params[:id]}/images/#{image.id}"
  end

  def edit
    redirect_unauthorized_user(current_user, params[:id])
    @image = Image.find_by(id: params[:image_id])
    category_options
    order_integer_range
  end

  def update
    redirect_unauthorized_user(current_user, params[:id])
    image = Image.find_by(id: params[:image_id])
    if image.update_attributes(image_params)
      flash[:notice] = "Image info saved"
    end
    redirect_to "/artists/#{params[:id]}/images/#{params[:image_id]}/edit"
  end

  def delete
    redirect_unauthorized_user(current_user, params[:id])
    Image.delete(params[:image_id])
    redirect_to "/artists/#{params[:id]}/images/"
  end

  private

  def image_params
    params.require(:image).permit(:name, :category, :order, :file, :artist_id)
  end

  def category_options
    @options = [['featured', 'featured'],['gallery', 'gallery']]
  end

  def order_integer_range
    @integer_range = Array (1..20)
  end
end
