class HomeController < ApplicationController
  before_action :determine_layout
  layout :determine_layout
  def index
    puts current_my_user
  end

  private
  def determine_layout
    puts"--------------------------checking user role------------------------------------------"
    puts current_my_user
    if current_my_user.role=='admin'
      page_layout="admin"
    else
      page_layout="merchant"
    end
  end
end
