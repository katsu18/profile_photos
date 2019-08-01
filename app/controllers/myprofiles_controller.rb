class MyprofilesController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @myprofiles = Myprofile.all
    @randam = @myprofiles.sample

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
    redirect_to myprofiles_path, notice: "タスク「#{@myprofile.name}を登録しました。」"
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

  def delete_image_attachment
    # @image = ActiveStorage::Blob.find_signed(params[:signed_id])
    # @image.purge
    # redirect_to myprofiles_path
  end

  def update
    @myprofile.update!(task_params)
    redirect_to myprofiles_path, notice: "タスク「#{@myprofile.name}を更新しました。」"
  end
  private

  def task_params

    params.require(:myprofile).permit(:name,:description, images: [] )
  end
  def set_task
    @myprofile = Myprofile.find(params[:id])
  end




end
