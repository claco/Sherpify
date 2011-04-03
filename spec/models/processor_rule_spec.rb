require 'spec_helper'

describe ProcessorRule do
  before(:each) do
    @rule = ProcessorRule.new
    @order = mock(Order)
    @result = mock(ProcessorResult)
  end

  it "should return false by default" do
    @rule.process(@order, @result).should be_false
  end
end
