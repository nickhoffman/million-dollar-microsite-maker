class MicrositesController < ApplicationController

  layout "microsite"
  
  def generate
    @companies = CanPages.search :loc => params[:location], :key => params[:topic]
    
    # debugger
    
    @location = "Toronto"
    @topic = "Dating"
  end
  
end
