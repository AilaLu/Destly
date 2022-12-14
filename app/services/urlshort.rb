require 'digest/sha2'
class Urlshort
  attr_reader :url, :link_model

  def initialize(url, link_model = Link)
  @url = url  
  @link_model = link_model
  end

  def generate_short_link
    link_model.create(url: url, lookup_code: lookup_code)
  end

  def lookup_code
    loop do 
    code = get_fresh_code
    break code unless link_model.exists?(lookup_code: code)
    end
  end

private
#use library SecureRandom
  def get_fresh_code
    SecureRandom.uuid[0..6]
  end
 
  
end