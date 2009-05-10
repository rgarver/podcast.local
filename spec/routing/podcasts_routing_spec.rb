require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PodcastsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "podcasts", :action => "index").should == "/podcasts"
    end
  
    it "maps #new" do
      route_for(:controller => "podcasts", :action => "new").should == "/podcasts/new"
    end
  
    it "maps #show" do
      route_for(:controller => "podcasts", :action => "show", :id => "1").should == "/podcasts/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "podcasts", :action => "edit", :id => "1").should == "/podcasts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "podcasts", :action => "create").should == {:path => "/podcasts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "podcasts", :action => "update", :id => "1").should == {:path =>"/podcasts/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "podcasts", :action => "destroy", :id => "1").should == {:path =>"/podcasts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/podcasts").should == {:controller => "podcasts", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/podcasts/new").should == {:controller => "podcasts", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/podcasts").should == {:controller => "podcasts", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/podcasts/1").should == {:controller => "podcasts", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/podcasts/1/edit").should == {:controller => "podcasts", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/podcasts/1").should == {:controller => "podcasts", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/podcasts/1").should == {:controller => "podcasts", :action => "destroy", :id => "1"}
    end
  end
end
