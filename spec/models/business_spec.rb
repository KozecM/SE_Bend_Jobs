require 'rails_helper'
require "business.rb"
require "big_dependency.rb"

RSpec.describe Business, type: :model do
  let(:business) { Business.new(name: "FAKE BUSINESS") }
  
  

    it "STUB it returns 42" do
        allow(business).to receive(:perform).and_return(42)
        result = business.perform(BigDependency.new)
        expect(result).to eq(42)
        expect(business).to have_received(:perform)
    end
    
    it "MOCK it returns 42" do
        expect(business).to receive(:perform).and_return(42)
        result = business.perform(BigDependency.new)
        expect(result).to eq(42)
    end

    it "DOUBLE returns 42" do
        twin = double(perform: 42)
        allow(twin).to receive(:perform).and_return(42)
        expect(twin.perform(BigDependency.new)).to eq(42)
        expect(twin).to have_received(:perform)
    end
end
