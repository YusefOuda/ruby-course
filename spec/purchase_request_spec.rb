require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequest do
  describe '#initialize' do
    it 'initializes a purchase request for a given breed' do
      purchase_req = PuppyBreeder::PurchaseRequest.new("Greyhound")

      expect(purchase_req.breed).to eq("Greyhound")
    end
  end
end