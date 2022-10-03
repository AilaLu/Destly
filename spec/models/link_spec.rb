require 'rails_helper'

RSpec.describe Link, type: :model do
  it "always has a URL and always has a lookup code" do
    link = Link.new(
      url:  "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc",
      lookup_code: "1234567"
    )
    link.save
    
  end

end