require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PodcastsController do

  def mock_podcast(stubs={})
    @mock_podcast ||= mock_model(Podcast, stubs)
  end
  
  describe "GET index" do
    it "assigns all podcasts as @podcasts" do
      Podcast.stub!(:find).with(:all).and_return([mock_podcast])
      get :index
      assigns[:podcasts].should == [mock_podcast]
    end
  end

  describe "GET show" do
    it "assigns the requested podcast as @podcast" do
      Podcast.stub!(:find).with("37").and_return(mock_podcast)
      get :show, :id => "37"
      assigns[:podcast].should equal(mock_podcast)
    end
  end

  describe "GET new" do
    it "assigns a new podcast as @podcast" do
      Podcast.stub!(:new).and_return(mock_podcast)
      get :new
      assigns[:podcast].should equal(mock_podcast)
    end
  end

  describe "GET edit" do
    it "assigns the requested podcast as @podcast" do
      Podcast.stub!(:find).with("37").and_return(mock_podcast)
      get :edit, :id => "37"
      assigns[:podcast].should equal(mock_podcast)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created podcast as @podcast" do
        Podcast.stub!(:new).with({'these' => 'params'}).and_return(mock_podcast(:save => true))
        post :create, :podcast => {:these => 'params'}
        assigns[:podcast].should equal(mock_podcast)
      end

      it "redirects to the created podcast" do
        Podcast.stub!(:new).and_return(mock_podcast(:save => true))
        post :create, :podcast => {}
        response.should redirect_to(podcast_url(mock_podcast))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved podcast as @podcast" do
        Podcast.stub!(:new).with({'these' => 'params'}).and_return(mock_podcast(:save => false))
        post :create, :podcast => {:these => 'params'}
        assigns[:podcast].should equal(mock_podcast)
      end

      it "re-renders the 'new' template" do
        Podcast.stub!(:new).and_return(mock_podcast(:save => false))
        post :create, :podcast => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested podcast" do
        Podcast.should_receive(:find).with("37").and_return(mock_podcast)
        mock_podcast.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :podcast => {:these => 'params'}
      end

      it "assigns the requested podcast as @podcast" do
        Podcast.stub!(:find).and_return(mock_podcast(:update_attributes => true))
        put :update, :id => "1"
        assigns[:podcast].should equal(mock_podcast)
      end

      it "redirects to the podcast" do
        Podcast.stub!(:find).and_return(mock_podcast(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(podcast_url(mock_podcast))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested podcast" do
        Podcast.should_receive(:find).with("37").and_return(mock_podcast)
        mock_podcast.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :podcast => {:these => 'params'}
      end

      it "assigns the podcast as @podcast" do
        Podcast.stub!(:find).and_return(mock_podcast(:update_attributes => false))
        put :update, :id => "1"
        assigns[:podcast].should equal(mock_podcast)
      end

      it "re-renders the 'edit' template" do
        Podcast.stub!(:find).and_return(mock_podcast(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested podcast" do
      Podcast.should_receive(:find).with("37").and_return(mock_podcast)
      mock_podcast.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the podcasts list" do
      Podcast.stub!(:find).and_return(mock_podcast(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(podcasts_url)
    end
  end

end
