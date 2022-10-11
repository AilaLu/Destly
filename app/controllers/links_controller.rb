class LinksController < ApplicationController

  def show
    @link = Link.find_by(lookup_code: params[:lookup_code])
    redirect_to @link.url
  end
  
  def create
    url = link_params[:url]
    urlshort = Urlshort.new(url)
    @link = urlshort.generate_short_link
  end

  private
  def link_params
    params.require(:link).permit(:url)
  end
end