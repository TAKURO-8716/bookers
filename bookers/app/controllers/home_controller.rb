class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show
  # before_filter :authenticate_user!
  
  def index
  end

  def show
  end
end
