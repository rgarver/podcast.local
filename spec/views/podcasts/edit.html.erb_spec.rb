require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/podcasts/edit.html.erb" do
  include PodcastsHelper
  
  before(:each) do
    assigns[:podcast] = @podcast = stub_model(Podcast,
      :new_record? => false
    )
  end

  it "renders the edit podcast form" do
    render
    
    response.should have_tag("form[action=#{podcast_path(@podcast)}][method=post]") do
    end
  end
end


