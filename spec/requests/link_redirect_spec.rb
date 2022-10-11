require "rails_helper"

RSpec.describe "Link rediection", type: :request do
  it "redirects to the original url with the given shortlink" do
    url = "https://www.hiretechladies.com/jobs?locations=Remote%7CRemote%20-%20APAC%7CRemote%20-%20Americas%7CRemote%20-%20Canada%7CRemote%20-%20Europe%7CRemote%20-%20USA&categories=Engineering"
    urlshort = Urlshort.new(url)
    link = urlshort.generate_short_link
    get link.url_shortlink
    expect(response).to redirect_to(link.url)
  end
end