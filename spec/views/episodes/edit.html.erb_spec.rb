require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/edit.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    assigns[:episode] = @episode = stub_model(Episode,
      :new_record? => false
    )
  end

  it "renders the edit episode form" do
    render
    
    response.should have_tag("form[action=#{episode_path(@episode)}][method=post]") do
    end
  end
end


