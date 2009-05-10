require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/podcasts/new.html.erb" do
  include PodcastsHelper
  
  before(:each) do
    assigns[:podcast] = stub_model(Podcast,
      :new_record? => true
    )
  end

  it "renders new podcast form" do
    render
    
    response.should have_tag("form[action=?][method=post]", podcasts_path) do
    end
  end
end


