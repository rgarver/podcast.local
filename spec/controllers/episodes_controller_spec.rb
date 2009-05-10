require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EpisodesController do

  def mock_episode(stubs={})
    @mock_episode ||= mock_model(Episode, stubs)
  end
  
  describe "GET index" do
    it "assigns all episodes as @episodes" do
      Episode.stub!(:find).with(:all).and_return([mock_episode])
      get :index
      assigns[:episodes].should == [mock_episode]
    end
  end

  describe "GET show" do
    it "assigns the requested episode as @episode" do
      Episode.stub!(:find).with("37").and_return(mock_episode)
      get :show, :id => "37"
      assigns[:episode].should equal(mock_episode)
    end
  end

  describe "GET new" do
    it "assigns a new episode as @episode" do
      Episode.stub!(:new).and_return(mock_episode)
      get :new
      assigns[:episode].should equal(mock_episode)
    end
  end

  describe "GET edit" do
    it "assigns the requested episode as @episode" do
      Episode.stub!(:find).with("37").and_return(mock_episode)
      get :edit, :id => "37"
      assigns[:episode].should equal(mock_episode)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created episode as @episode" do
        Episode.stub!(:new).with({'these' => 'params'}).and_return(mock_episode(:save => true))
        post :create, :episode => {:these => 'params'}
        assigns[:episode].should equal(mock_episode)
      end

      it "redirects to the created episode" do
        Episode.stub!(:new).and_return(mock_episode(:save => true))
        post :create, :episode => {}
        response.should redirect_to(episode_url(mock_episode))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved episode as @episode" do
        Episode.stub!(:new).with({'these' => 'params'}).and_return(mock_episode(:save => false))
        post :create, :episode => {:these => 'params'}
        assigns[:episode].should equal(mock_episode)
      end

      it "re-renders the 'new' template" do
        Episode.stub!(:new).and_return(mock_episode(:save => false))
        post :create, :episode => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested episode" do
        Episode.should_receive(:find).with("37").and_return(mock_episode)
        mock_episode.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :episode => {:these => 'params'}
      end

      it "assigns the requested episode as @episode" do
        Episode.stub!(:find).and_return(mock_episode(:update_attributes => true))
        put :update, :id => "1"
        assigns[:episode].should equal(mock_episode)
      end

      it "redirects to the episode" do
        Episode.stub!(:find).and_return(mock_episode(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(episode_url(mock_episode))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested episode" do
        Episode.should_receive(:find).with("37").and_return(mock_episode)
        mock_episode.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :episode => {:these => 'params'}
      end

      it "assigns the episode as @episode" do
        Episode.stub!(:find).and_return(mock_episode(:update_attributes => false))
        put :update, :id => "1"
        assigns[:episode].should equal(mock_episode)
      end

      it "re-renders the 'edit' template" do
        Episode.stub!(:find).and_return(mock_episode(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested episode" do
      Episode.should_receive(:find).with("37").and_return(mock_episode)
      mock_episode.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the episodes list" do
      Episode.stub!(:find).and_return(mock_episode(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(episodes_url)
    end
  end

end
