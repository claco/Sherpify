require 'spec_helper'

describe Order do
  let(:order)   { subject }
  let(:product) { Factory.build(:product) }
  let(:item)    { order.items.first }

  describe "add" do
    it "should accept a product" do
      order.add(product)

      item.product.should be(product)
    end

    it "should default quantity to 1" do
      order.add(product)

      item.quantity.should be(1)
    end
  end
end
