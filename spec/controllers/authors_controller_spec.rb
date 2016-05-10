require 'rails_helper'

RSpec.describe AuthorsController, :type => :controller do
  describe "GET #index" do
    it 'returns a successfull http request status code' do
      get :index

      expect(response).to have_http_status(:success) 
    end
  end
end
