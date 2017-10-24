require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "show action" do

    it "renders show template if item exist" do
      item = create(:item)
      get :show, params: {id: item.id}
      expect(response).to render_template(:show)
    end

    it "renders 404 page if item !exist" do
      get :show, params: {id: 0}
      expect(response.status).to eq(404)
    end

  end

end
