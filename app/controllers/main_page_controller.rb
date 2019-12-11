class MainPageController < ApplicationController
  skip_before_action :authenticate_user!, except: :destroy

  def show; end
end
