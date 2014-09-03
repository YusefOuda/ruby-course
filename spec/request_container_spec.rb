require_relative 'spec_helper.rb'

describe PuppyBreeder::RequestContainer do
  before(:all) do

    @order1 = PuppyBreeder::PurchaseRequest.new("Boxer")
    @order2 = PuppyBreeder::PurchaseRequest.new("Great Dane")
    @order3 = PuppyBreeder::PurchaseRequest.new("TEST")
    PuppyBreeder::RequestContainer.add_order(@order1)
    PuppyBreeder::RequestContainer.add_order(@order2)
    PuppyBreeder::RequestContainer.add_order(@order3)
  end

  describe '.add_order' do
    it 'checks if puppy container has a suitable puppy' do
      res = PuppyBreeder::RequestContainer.get_orders.first
      expect(res.status).to eq('hold')
    end
  end

  describe '.get_completed_orders' do
    it 'returns the orders which have a status of complete' do
      expect(PuppyBreeder::RequestContainer.get_completed_orders.size).to eq(0)
    end
  end

  describe '.review_purchase_request' do
    it 'returns order which has a status of pending using id' do
      res1 = PuppyBreeder::RequestContainer.review_purchase_request
      expect(res1).to include(@order2)
    end
  end

  describe '.accept_purchase_request' do
    it 'accept the purchase request with given id' do
      PuppyBreeder::RequestContainer.accept_purchase_request
      expect(PuppyBreeder::RequestContainer.get_completed_orders).to include(@order2)
    end
  end
end