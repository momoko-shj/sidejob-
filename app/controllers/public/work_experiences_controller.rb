class Public::WorkExperiencesController < ApplicationController
  
  def show
   @user = current_user
   @work_experiences = current_user.work_experiences.all
   @work_experience = WorkExperience.new
  end
  
  def create
   @work_experience = current_user.work_experiences.new(work_experience_params)
   @work_experience.save ? (redirect_to work_experience_path(current_user)) : (render :show)
  end
  
  def edit
    @work_experience = WorkExperience.find(params[:id])
  end
  
  def update
    @work_experience = WorkExperience.find(params[:id])
    @work_experience.update(work_experience_params) ? (redirect_to work_experience_path) : (render :edit)
  end

private

def work_experience_params
  params.require(:work_experience).permit(:user_id, :company_name, :industory_type, :joined_date, :position, :career_history)
  .merge( {joined_date: params[:work_experience][:joined_date] + "-1"} )
end
  
end
