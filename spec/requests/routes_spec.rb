require "rails_helper"

RSpec.describe "Routes" do
  describe "GET /routes" do
    it "returns a success response" do
      get "/routes"
      expect(response).to be_successful
    end
  end

  describe "POST /routes" do
    let(:valid_params) { { route: attributes_for(:route) } }
    let(:invalid_params) { { route: { source: "", destination: "" } } }

    it "should render the new route form" do
      get "/routes/new"
      expect(response).to render_template(:new)
    end

    it "creates a new route" do
      expect do
        post "/routes", params: valid_params
      end.to change(Route, :count).by(1)
    end

    it "should not create new route for invalid params" do
      expect do
        post "/routes", params: invalid_params
      end.to change(Route, :count).by(0)
    end

    it "returns a success response" do
      post "/routes", params: valid_params
      expect(response).to have_http_status(:created)
    end
  end

  describe "PUT /routes" do
    let(:route) { create(:route) }
    let(:valid_params) { { route: { source: "Dhaka" } } }
    let(:invalid_params) { { route: { source: "1invalid2" } } }

    it "should render the edit route form" do
      get "/routes/#{route.id}/edit"
      expect(response).to render_template(:edit)
    end

    it "updates the route" do
      put "/routes/#{route.id}", params: valid_params
      route.reload
      expect(route.source).to eq("Dhaka")
    end

    it "should not updates the route for invalid params" do
      put "/routes/#{route.id}", params: invalid_params
      route.reload
      expect(route.source).not_to eq("1invalid2")
    end

    it "returns a success response" do
      put "/routes/#{route.id}", params: valid_params
      expect(response).to have_http_status(:see_other)
    end
  end

  describe "DELETE /routes/:id" do
    let!(:route) { create(:route) }

    it "destroys the requested route" do
      expect do
        delete "/routes/#{route.id}"
      end.to change(Route, :count).by(-1)
    end

    it "returns a success response" do
      delete "/routes/#{route.id}"
      expect(response).to have_http_status(:see_other)
    end
  end
end
