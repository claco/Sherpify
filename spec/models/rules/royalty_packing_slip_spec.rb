require 'spec_helper'

describe Rules::RoyaltyPackingSlip do
  let(:rule)   { subject }
  let(:order)  { Factory.build(:order_with_book) }
  let(:item)   { order.items.first }
  let(:result) { mock(ProcessorResult, :packing_slips => slips) }
  let(:slip)   { mock(PackingSlip, :items => items) }
  let(:items)  { [] }
  let(:slips)  { [] }

  before {
    rule.stub(:packing_slip).and_return(slip)
  }

  describe "process" do
    it "should set packing slip type to :royalties" do
      slip.should_receive(:type=).with(:royalties)

      rule.process(order, result)
    end

    it "should add the items to the slip" do
      slip.should_receive(:type=).with(:royalties)
      rule.process(order, result)
      
      slip.items.should include(item)
    end

    it "should add the packing slip to the result" do
      slip.should_receive(:type=).with(:royalties)
      rule.process(order, result)

      slips.should include(slip)
    end
  end
end
