class PhotosController < ApplicationController
  before_action :set_photo ,only: [ :edit, :update, :destroy]

  def index
    redirect_to myprofiles_path
  end
  def new
    @photo = Photo.new
  end
  def create

    @photo = Photo.new(photo_params)
    if params[:back].present?
      render :new
      return
    end
    
    if @photo.save
    #photoMailer.creation_email(@photo).deliver_now
    #SampleJob.set(wait: 5.seconds).perform_later
    #logger.debug "photo: #{@photo.attributes.inspect}"#コンソールにデバック載せるお
    redirect_to photos_path, notice: "タスク「#{@photo.content}を登録しました。」"
    else
      render :new
    end
  end

  def destroy

    @photo.destroy
      head :no_content
  end


  private 

  def photo_params

    params.require(:photo).permit(:content, :image,{ :myprofile_ids => [] })

  end

  def set_photo
    photo_all = Photo.all
    @photo = photo_all.find(params[:id])

  end

end
