#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_reader :breed, :id
    attr_accessor :status

    def initialize(breed)
      @breed = breed
      @status = 'pending'
    end

    def complete_order
      @status = 'complete'
    end

    def completed?
      return true if @status == 'complete'
      false
    end

    def hold?
      return true if @status == 'hold'
      false
    end

    def put_on_hold
      @status = 'hold'
    end
  end
end