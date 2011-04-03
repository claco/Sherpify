require 'spec_helper'

describe OrdersController do

  before(:each) do
    @order = Factory.build(:order_with_items)
  end

  describe "GET 'index'" do
    it "should receive the next available order" do
      Order.should_receive(:next_in_queue).and_return(@order)

      get 'index'
      response.should be_success

      assigns[:order].should == @order
    end
  end

  describe "GET 'process_order'" do
    it "should display a success message" do
      get 'process_order', :id => 1

      flash[:notice].should include('processed successfully')
    end
  end
end
