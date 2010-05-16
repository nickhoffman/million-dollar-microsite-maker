class MicrositesController < ApplicationController

  layout "microsite"
  
  def generate
    @companies = CanPages.search :loc => params[:location], :key => params[:topic]
    @articles = PostRankSearcher.search_by_topic params[:topic]
    
    @image = GoogleImageScraper.find_first_image_for_keyword(params[:topic])
    
    # debugger
    
    @location = params[:location]
    @topic = params[:topic]
  end
  
  def site_redirect
  
    #UUUUUGGLY. making it work with the splash page form + clean urls + no actual resources
    redirect_to "/#{params[:topic]}/in/#{params[:location]}"
    
  end
  
end
