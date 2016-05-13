require 'rails_helper'

RSpec.describe PublishersController, :type => :controller do
  describe "GET #index" do
    it 'returns a successfull http request status code' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it 'returns a successfull http request status code' do
      publisher = Fabricate(:publisher)

      get :show, id: publisher.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it 'returns a successfull http request status code' do
      get :new

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a seccessful create" do
      it "saves the new publisher object" do
        post :create, publisher: Fabricate.attributes_for(:publisher)

        expect(Publisher.count).to eq(1)
      end

      it "redirects to the publisher show view" do
        post :create, publisher: Fabricate.attributes_for(:publisher)

        expect(response).to redirect_to publisher_path(Publisher.last)
      end

      it "sets the success flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher)

        expect(flash[:success]).to eq("Publisher has been created")
      end
    end

    context "an unsuccessful create" do
      it "does not save the publisher object with invalid inputs" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)

        expect(Publisher.count).to eq(0)
      end

      it "sets the failure flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)

        expect(flash[:danger]).to eq("Publisher has not been created")
      end
    end
  end

  describe "GET #edit" do
    let (:publisher) { Fabricate(:publisher) }

    it 'sends a successfull edit request' do
      get :edit, id: publisher

      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successfull update" do
      let(:john) { Fabricate(:publisher, name: "John") }

      it "updates the modified publisher object" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Mike"), id: john.id

        expect(Publisher.last.name).to eq("Mike")
        expect(Publisher.last.name).not_to eq("John")
      end

      it "sets the success flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Mike"), id: john.id

        expect(flash[:success]).to eq("Publisher has been updated")
      end
      it "it redirects to the show action" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Mike"), id: john.id

        expect(response).to redirect_to(publisher_path(Publisher.last))
      end
    end

    context "unsuccessfull update" do
      let(:john) { Fabricate(:publisher, name: "John") }

      it "does not update the publisher object with invalid inputs" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: nil), id: john.id

        expect(Publisher.last.name).to eq("John")
      end

      it "sets the failure flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: nil), id: john.id

        expect(flash[:danger]).to eq("Publisher has not been updated")
      end
    end
  end

  describe "DELETE #destroy" do
    let (:publisher) { Fabricate(:publisher)}

    it "deletes the publisher object with the given id" do
      delete :destroy, id: publisher.id

      expect(Publisher.count).to eq(0)
    end

    it "sets the falsh message" do
      delete :destroy, id: publisher.id

      expect(flash[:success]).to eq("Publisher has been deleted")
    end

    it "redirects to the index action" do
      delete :destroy, id: publisher.id

      expect(response).to redirect_to publishers_path
    end
  end
end
