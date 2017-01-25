class PicturesController < ApplicationController
  #создаем новый экшн creat
  def create
    @picture = Picture.new(image_params) #создаем новую картинку с переданными параметрами
    @picture.save # сохранить в проект
    respond_to do |format| #передаем картинку в json
      format.json { render :json => { url: @picture.image.url(:large), picture_id: @picture.id } } # передаем параметры картинки = large , id
    end
  end
  #создаем новый экшн destroy
  def destroy
    picture = Picture.find(params[:id]) # по id находим картинку
    picture.destroy # удалить из проекта
    respond_to do |format|
      format.json { render json: { status: :ok } } # проверяет статус json
    end
  end
# создаем проверку на данные, что не получать другие значения кроме, picture = image
  private

  def image_params
    params.require(:picture).permit(:image)
  end
end