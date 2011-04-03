require 'spec_helper'

describe OrdersController do

  before(:each) do
    @order = Factory.build(:order_with_items)

    controller.should_receive(:orders).and_return(orders)
  end

  def orders
    @orders ||= mock('Order', :find => @order, :next_in_queue => @order)
  end

  def processor_result
    @result ||= mock(ProcessorResult, :success => true)
    
    @slips ||= []
    @result.should_receive(:packing_slips).and_return(@slips)
    @result
  end

  def processor
    @processor ||= mock(OrderProcessor)
    @processor.should_receive(:process).and_return(processor_result)
    @processor
  end

  describe "GET 'index'" do
    it "should receive the next available order" do
      get 'index'
      response.should be_success

      assigns[:order].should == @order
    end
  end

  describe "GET 'process_order'" do
    it "should display a message when processing successful" do
      controller.should_receive(:processor).and_return(processor)

      get 'process_order', :id => 1

      flash[:notice].should include('processed successfully')
    end

    it "should have a list of packing slips" do
      controller.should_receive(:processor).and_return(processor)

      get 'process_order', :id => 1

      assigns[:packing_slips].should == @slips
    end
  end
end
