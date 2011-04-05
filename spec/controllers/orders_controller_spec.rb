require 'spec_helper'

describe OrdersController do
  let(:order)     { Factory.build(:order_with_items) }
  let(:orders)    { mock(Order, :find => order, :next_in_queue => order) }
  let(:result)    { mock(ProcessorResult, :success => true, :packing_slips => slips) }
  let(:processor) { mock(OrderProcessor) }
  let(:slips)     { [] }

  before {
    controller.should_receive(:orders).and_return(orders)
  }

  describe "GET 'index'" do
    it "should receive the next available order" do
      get 'index'

      response.should be_success
      assigns[:order].should be(order)
    end
  end

  describe "GET 'process_order'" do
    before {
      controller.should_receive(:processor).and_return(processor)
      processor.should_receive(:process).and_return(result)
    }

    it "should display a message when processing successful" do
      get 'process_order', :id => 1

      flash[:notice].should include('processed successfully')
    end

    it "should have a list of packing slips" do
      get 'process_order', :id => 1

      assigns[:packing_slips].should == slips
    end
  end
end
