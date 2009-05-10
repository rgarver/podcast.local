require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/index.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    assigns[:episodes] = [
      stub_model(Episode),
      stub_model(Episode)
    ]
  end

  it "renders a list of episodes" do
    render
  end
end

