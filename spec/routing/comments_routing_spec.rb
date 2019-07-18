require "rails_helper"

RSpec.describe CommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/blogs/1/comments").to route_to("comments#index", :blog_id =>"1")
    end

    it "routes to #show" do
      expect(:get => "/blogs/1/comments/1").to route_to("comments#show", :blog_id =>"1", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/blogs/1/comments").to route_to("comments#create", :blog_id =>"1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/blogs/1/comments/1").to route_to("comments#update", :blog_id =>"1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/blogs/1/comments/1").to route_to("comments#update", :blog_id =>"1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blogs/1/comments/1").to route_to("comments#destroy", :blog_id =>"1", :id => "1")
    end
  end
end
