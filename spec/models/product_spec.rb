require 'spec_helper'

describe Product do
  it "should itentify physical delivery" do
    product = Factory.build(:physical_product)
    product.physical?.should be_true
  end
end
