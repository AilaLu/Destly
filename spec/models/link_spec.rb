require 'rails_helper'

RSpec.describe Link, type: :model do

  it "is valid if always has a URL and always has a lookup code" do
    link = Link.new(
      url:  "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc",
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  

  it "is invalid if no url" do
    link = Link.new(
      lookup_code: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "is invalid if no lookup code" do
    link = Link.new(
      url:  "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
    )
    expect(link.valid?).to be(false)
  end


  it "is invalid if lookup code is not unique" do
    link = Link.new(
      url:  "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc",
      lookup_code: "1234567"
    )
    link.save
    link2 = Link.new(
      url:  "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWabcd",
      lookup_code: "1234567"
    )
    expect(link2.valid?).to be(false)
  end

end