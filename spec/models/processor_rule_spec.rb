require 'spec_helper'

describe ProcessorRule do
  let(:slip)   { subject }
  let(:order)  { mock(Product) }
  let(:result) { mock(ProcessorResult) }

  describe "process" do
    it "should return false by default" do
      slip.process(order, result).should be_false
    end
  end
end
