require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /comments" do
    it "works! (now write some real specs)" do
      @id = create(:blog).id
      get '/blogs/'+@id.to_s+'/comments'
      expect(response).to have_http_status(200)
    end
  end
end
