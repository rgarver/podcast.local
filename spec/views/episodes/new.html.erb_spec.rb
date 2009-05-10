require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/episodes/new.html.erb" do
  include EpisodesHelper
  
  before(:each) do
    assigns[:episode] = stub_model(Episode,
      :new_record? => true
    )
  end

  it "renders new episode form" do
    render
    
    response.should have_tag("form[action=?][method=post]", episodes_path) do
    end
  end
end


