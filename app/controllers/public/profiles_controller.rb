class Public::ProfilesController < ApplicationController
  
  # ユーザーによるプロフィール作成機能
  def new
    @profile = Profile.new
    @certification = Certification.new
    @user = current_user
  end
  
   # コメントアウト部分：資格登録機能でメンターにより実装済み。エラーとなった際に自力での対応が困難と判断し取り下げ。
   
  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      # params[:profile][:certification_ids].each do |certification_id|
      #   CertificationManager.create(profile_id: @profile.id, certification_id: certification_id)
      # end
      redirect_to mypage_path(@profile)
    else
      render :new
    end
  end
  
 
  # プロフィール編集画面
  def edit
    @user = current_user
    @profile = @user.profile
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      # CertificationManager.where(profile_id: @profile.id).destroy_all
      # params[:profile][:certification_ids].each do |certification_id|
      #   CertificationManager.create(profile_id: @profile.id, certification_id: certification_id)
      # end
      redirect_to profile_path
    else
      render :edit
    end
  end
  
  def index
    @profiles = Profile.all.order(updated_at: :desc)
  end
  
  # ダイレクトメールの実装
  def show
    @profile = Profile.find(params[:id])
    @comment = Comment.new
    @user = @profile.user
    @work_experience = @user.work_experiences
    
    (current_user.rooms.ids & @user.rooms.ids).present?
    

    # @currentUserEntry = Entry.where(user_id: current_user.id)
    # @userEntry = Entry.where(user_id: @user.id)
    if @user.id != current_user.id
      # @currentUserEntry.each do |cu|
      #  @userEntry.each do |u|
          # if cu.room_id == u.room.id then
            #@isRoom = true
            #@roomId = cu.room_id
          #end
        #end 
      #end
      @isRoom = (current_user.rooms.ids & @user.rooms.ids).present?
      if @isRoom
        @room = Room.find((current_user.rooms.ids & @user.rooms.ids).first)
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
    
  private
  
  def profile_params
    params.require(:profile).permit(:user_id, :birthday, :education, :introduction, :skill,
    :other_certification, :additional_information, :is_active, :image)
  end
  
  def certification_manager_params
    params.require(:certification_manager).permit(:user_id, :certification_id)
  end
  
  def certification_params
    params.require(:certification).permit(:name)
  end
  
end
