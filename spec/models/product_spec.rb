require 'spec_helper'

describe Product do
  let(:product)    { Product.new(attributes) }
  let(:attributes) { {:name => 'name', :price => 1, :delivery => 'physical'} }

  describe "physical?" do
    it "should identify physical delivery" do
      product.physical?.should be_true
    end
  end

  describe "save" do
    it "should require name" do
      attributes[:name] = nil

      product.save
      product.should have(1).error_on(:name)
    end
    
    it "should require price" do
      attributes[:price] = nil

      product.save
      product.should have(1).error_on(:price)
    end

    it "should require delivery" do
      attributes[:delivery] = nil

      product.save
      product.should have(1).error_on(:delivery)
    end
  end
end
