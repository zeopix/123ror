require 'spec_helper'

describe SportsController do
  render_views
  describe "index" do
    before do
      xhr :get, :index, format: :json
    end

    subject(:results) { JSON.parse(response.body) }


    context "when the search finds results" do
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return results' do
        expect(results.sports.size).to gt(0)
      end
      it "should include 'tal/ Cheese'" do
        #expect(results.map(&extract_name)).to include('Baked Potato w/ Cheese')
      end
    end


  end
end
