class HomeController < ApplicationController
  before_filter :check
  def index
  end
  
  def check
  if not session[:user].nil?
  true
  else
   respond_to do |format|
      format.html { render :inline => "NO", :status =>"404" }
      format.json { render json: @sessions}
   end
  end
end

end
