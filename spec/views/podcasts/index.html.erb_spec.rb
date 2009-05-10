require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/podcasts/index.html.erb" do
  include PodcastsHelper
  
  before(:each) do
    assigns[:podcasts] = [
      stub_model(Podcast),
      stub_model(Podcast)
    ]
  end

  it "renders a list of podcasts" do
    render
  end
end

