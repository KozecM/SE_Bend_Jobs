require "rails_helper"

RSpec.describe CreatesBusiness do
    let(:creator) {CreatesBusiness.new(name: "NEW BUSINESS")}

    it "creates a business given a name" do
        creator.build
        expect(creator.business.name).to eq("NEW BUSINESS")
    end
end
