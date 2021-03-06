class Admin::KidsController < Admin::BaseController
  before_action :set_kid, only: [:show, :edit, :update, :destroy]

  def new
    @kid = Kid.new()
  end

  def create
    kid = current_user.kids.create(kid_params)
    if kid.save
      flash.notice = "#{kid.name} was successfully created!"
      redirect_to admin_kid_path(kid)
    else
      flash.alert = "Save unsuccessful, please try again."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @kid = Kid.update(kid_params)
      flash.notice = "Updates saved."
    else
      flash.alert = "Updates not saved."
    end
    redirect_to admin_kid_path(@kid)
  end

  def destroy
    user_kids = UserKid.where(kid_id: @kid.id)
    user_kids.each do |user_kid|
      user_kid.destroy
    end
    @kid.destroy
    current_user.kids.destroy(@kid)
    flash.notice = "#{@kid.name} was successfully deleted."
    redirect_to kids_path
  end

  private
    def kid_params
      params.require(:kid).permit(:name)
    end

    def set_kid
      @kid = Kid.find(params[:id])
    end
end
