require 'spec_helper'

describe Order do
  before(:each) do
    @order = Factory.build(:order)
  end

  it "can add a product to items" do
    product = Factory.build(:product)
    @order.add(product)

    item = @order.items.first
    item.quantity.should == 1
    item.product.should == product
  end
end
