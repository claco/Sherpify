require 'spec_helper'

describe OrderItem do
  let(:item)       { OrderItem.new(attributes) }
  let(:order)      { Factory.build(:order) }
  let(:product)    { Factory.build(:product) }
  let(:attributes) { {order: order, :product => product, :quantity => 1} }

  describe "save" do
    it "should require quantity" do
      attributes[:quantity] = nil

      item.save
      item.should have(1).error_on(:quantity)
    end

    it "should require order" do
      attributes[:order] = nil

      item.save
      item.should have(1).error_on(:order)
    end

    it "should require product" do
      attributes[:product] = nil

      item.save
      item.should have(1).error_on(:product)
    end
  end
end
