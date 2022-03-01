class HomeController < ApplicationController
  before_action :determine_layout
  layout :determine_layout
  
  def index
  
  end

  private
  def determine_layout
    if current_my_user.role=='admin'
      page_layout="admin"
    else
      page_layout="merchant"
    end
  end
end
