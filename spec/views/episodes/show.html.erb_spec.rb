require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/show.html.erb" do
  include EpisodesHelper
  before(:each) do
    assigns[:episode] = @episode = stub_model(Episode)
  end

  it "renders attributes in <p>" do
    render
  end
end

