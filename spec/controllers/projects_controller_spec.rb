require 'spec_helper'

describe ProjectsController do
    it "handles a missing project correctly" do
        get :show, id: "not-here"
      
        response.should redirect_to(projects_path)
        
        message = "The project you were looking for could not be found."
        flash[:alert].should eq message
      end
end
