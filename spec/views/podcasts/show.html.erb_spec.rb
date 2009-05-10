require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/podcasts/show.html.erb" do
  include PodcastsHelper
  before(:each) do
    assigns[:podcast] = @podcast = stub_model(Podcast)
  end

  it "renders attributes in <p>" do
    render
  end
end

