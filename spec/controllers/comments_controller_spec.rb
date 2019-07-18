require 'rails_helper'


RSpec.describe CommentsController, type: :controller do

  
  #let(:blog) { create(:blog) } 
  let(:valid_attributes) {
    {
      name: FFaker::Name.name,
      comment:  FFaker::Lorem.phrase,
      blog_id: create(:blog).id
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      comment:  nil,
      blog_id: create(:blog).id
    }
  }

  
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :index, params: {blog_id: create(:blog).id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :show, params: {blog_id: create(:blog).id,id: comment.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {blog_id: create(:blog).id,comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "renders a JSON response with the new comment" do

        post :create, params: {blog_id: create(:blog).id,comment: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        #expect(response.location).to eq(comment_url(Comment.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new comment" do

        post :create, params: {blog_id: create(:blog).id,comment: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          name: FFaker::Name.name,
          comment:  FFaker::Lorem.phrase,
          blog_id: create(:blog).id
        }
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {blog_id: create(:blog).id,id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        new_attributes.each_pair do |key, value|
          expect(comment[key]).to eq(value)  
        end
      end

      it "renders a JSON response with the comment" do
        comment = Comment.create! valid_attributes

        put :update, params: {blog_id: create(:blog).id,id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the comment" do
        comment = Comment.create! valid_attributes

        put :update, params: {blog_id: create(:blog).id,id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {blog_id: create(:blog).id,id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end
  end

end
