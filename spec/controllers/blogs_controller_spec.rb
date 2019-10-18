require 'rails_helper'


RSpec.describe BlogsController, type: :controller do

  
  let(:valid_attributes) {{
    title:  FFaker::Name.name, 
    body:  FFaker::Lorem.sentence, 
    image:  FFaker::Name.name, 
    description:  FFaker::Lorem.phrase 
  }}

  let(:invalid_attributes) {{
    title:  nil,
    body:  nil, 
    image:  nil,
    description: nil 
  }}

  
  let(:valid_session) { {} }

  describe "GET #index" do
    before do
      get :index, params: {}, session: valid_session
    end
    
    it "returns a success response" do
      blog = Blog.create! valid_attributes
      expect(response).to be_successful
    end

    it 'should has json content type' do
      expect(response.content_type).to eq("application/json")
    end

    it 'returns all the blogs' do
      parsed_blog = JSON.parse(response.body)
      expect(parsed_blog['data'].length).to eq(parsed_blog['count'])  
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      blog = Blog.create! valid_attributes
      get :show, params: {id: blog.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Blog" do
        expect {
          post :create, params: {blog: valid_attributes}, session: valid_session
        }.to change(Blog, :count).by(1)
      end

      it "renders a JSON response with the new blog" do
        post :create, params: {blog: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        #expect(response.location).to eq(blog_url(Blog.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new blog" do

        post :create, params: {blog: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          title:  FFaker::Name.name, 
          body:  FFaker::Lorem.sentence, 
          image:  FFaker::Name.name, 
          description:  FFaker::Lorem.phrase 
        }
      }

      it "updates the requested blog" do
        blog = Blog.create! valid_attributes
        put :update, params: {id: blog.to_param, blog: new_attributes}, session: valid_session
        blog.reload
        new_attributes.each_pair do |key, value|
          expect(blog[key]).to eq(value)  
        end
      end

      it "renders a JSON response with the blog" do
        blog = Blog.create! valid_attributes

        put :update, params: {id: blog.to_param, blog: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the blog" do
        blog = Blog.create! valid_attributes

        put :update, params: {id: blog.to_param, blog: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested blog" do
      blog = Blog.create! valid_attributes
      expect {
        delete :destroy, params: {id: blog.to_param}, session: valid_session
      }.to change(Blog, :count).by(-1)
    end
  end

end
