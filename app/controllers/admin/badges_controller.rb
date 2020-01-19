class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[edit update show destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def create
    @badge = Badge.create(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
   params.require(:badge).permit(:title, :icon_url, :rule, :rule_value)
  end
end
