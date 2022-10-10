require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  it "can shorten a link provided by the user" do
  url = "https://www.youtube.com/watch?v=ZBs1a6Y25bY&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc"
  post :create, params: { link: {url: url}}
  #assigns: looking for instance variable that already has been set
  link = assigns(:link)
  expect(link.url).to eq (url)
  expect(link.valid?).to be (true)
  expect(link.lookup_code.length).to eq (7)
  end
end