require 'spec_helper'

describe Rules::ShippingPackingSlip do
   it "should create a shipping packing slip" do
    @order = Factory.build(:order_with_physical_item)
    @result = mock(ProcessorResult)
    @packing_slips = []
    @result.should_receive(:packing_slips).and_return(@packing_slips)

    @slip = mock(PackingSlip)
    @slip_items = []
    @slip.should_receive(:type=).with(:shipping)
    @slip.should_receive(:items).and_return(@slip_items)

    @rule = Rules::ShippingPackingSlip.new
    @rule.stub(:packing_slip).and_return(@slip)


    @rule.process(@order, @result)
  end
end
