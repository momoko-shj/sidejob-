class SearchesController < ApplicationController
  
  def result
    # if params[:education, :introduction, :skill, :other_certification, :additional_information].present?
    #   @profiles = Profile.where('name LIKE?', "%#{params[:education,:introduction,:skill,:other_certification,:additional_information]}%")
    # else
    #   @profiles = Profile.none
    # end
    @profiles = Profile.search(params[:keyword])
    
  end
  
  # https://qiita.com/toto_public/items/1b6919e35cd370c93ef5

  def search
     @profiles = Profile.search(params[:keyword])
  end
  
end
