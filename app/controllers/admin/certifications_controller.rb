class Admin::CertificationsController < ApplicationController
  
  def show
    @certification = Certification.new
    @certifications = Certification.all
  end

  def create
    @certification = Certification.new(certification_params)
    @certification.save ? (redirect_to admin_certification_path(@certification)) : (render :show)
  end
  
  def edit
    @certification = Certification.find(params[:id])
  end
  
  def update
    @certification = Certification.find(params[:id])
    @certification.update(certification_params) ? (redirect_to admin_certification_path) : (render :edit)
  end

  private
 
  def certification_params
    params.require(:certification).permit(:name)
  end
  
end
