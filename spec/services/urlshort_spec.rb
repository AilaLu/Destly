require 'rails_helper'

RSpec.describe Urlshort do

  it "shortens a URL to 7 character like bit.ly" do
    url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
    urlshort = Urlshort.new(url)
    expect(urlshort.lookup_code.length).to eq(7)
  end

  it "gives each URL its own lookup code" do
    url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
    urlshort = Urlshort.new(url)
    code1 = urlshort.lookup_code
    url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWabcd"
    urlshort = Urlshort.new(url)
    code2 = urlshort.lookup_code
    
    expect(code2).not_to eq(code1)
  end

  it "always gives the same lookup code to the same URL" do
    url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
    urlshort = Urlshort.new(url)
    code = urlshort.lookup_code
    url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
    urlshort = Urlshort.new(url)
    same_code = urlshort.lookup_code

    expect(code).to eq(same_code)
  end
  
  
end
