require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EpisodesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "episodes", :action => "index").should == "/episodes"
    end
  
    it "maps #new" do
      route_for(:controller => "episodes", :action => "new").should == "/episodes/new"
    end
  
    it "maps #show" do
      route_for(:controller => "episodes", :action => "show", :id => "1").should == "/episodes/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "episodes", :action => "edit", :id => "1").should == "/episodes/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "episodes", :action => "create").should == {:path => "/episodes", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "episodes", :action => "update", :id => "1").should == {:path =>"/episodes/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "episodes", :action => "destroy", :id => "1").should == {:path =>"/episodes/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/episodes").should == {:controller => "episodes", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/episodes/new").should == {:controller => "episodes", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/episodes").should == {:controller => "episodes", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/episodes/1").should == {:controller => "episodes", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/episodes/1/edit").should == {:controller => "episodes", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/episodes/1").should == {:controller => "episodes", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/episodes/1").should == {:controller => "episodes", :action => "destroy", :id => "1"}
    end
  end
end
