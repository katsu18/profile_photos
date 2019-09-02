class MyprofilesController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @myprofiles = Myprofile.all
    @randams = @myprofiles.sample
    if @randams.present?
    @randam  = @randams.photos.sample
    end
  end

  def create
    @myprofile = Myprofile.new(task_params)
    if params[:back].present?
      render :new
      return
    end
    
    if @myprofile.save
    #TaskMailer.creation_email(@myprofile).deliver_now
    #SampleJob.set(wait: 5.seconds).perform_later
    #logger.debug "task: #{@task.attributes.inspect}"#コンソールにデバック載せるお
    redirect_to myprofiles_path, notice: "タグ「#{@myprofile.name}を登録しました。」"
    else
      render :new
    end
  
  end

  def show

  end

  def edit
  end

  def new
    @myprofile = Myprofile.new
  end

  # def delete_image_attachment
  #   @image = ActiveStorage::Blob.find_signed(params[:myprofile_id])
  #   @image.purge_later
  #   binding.pry
  #   redirect_to myprofiles_path
  # end

  def update
    @myprofile.update!(task_params)
    redirect_to myprofiles_path, notice: "タグ「#{@myprofile.name}を更新しました。」"
  end
  private

  def task_params

    params.require(:myprofile).permit(:name,:description, images: [] )
  end
  def set_task
    @myprofile = Myprofile.find(params[:id])
  end




end
