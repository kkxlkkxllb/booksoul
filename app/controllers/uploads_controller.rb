class UploadsController < ApplicationController

  def index
    set_seo_meta(t('title.upload'),t('seo.keywords.upload'),t('seo.describe.upload'))
  end
  
  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      flash[:success] = t('upload.success')
      redirect_to uploads_path
    else
      flash[:fail] = t('error.upload')
      redirect_to uploads_path
    end
  end

end
