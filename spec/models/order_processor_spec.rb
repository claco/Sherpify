require 'spec_helper'

describe OrderProcessor do
  before(:each) do
    @result = mock(ProcessorResult)
    @result.should_receive(:success=).with(false)
    @processor = OrderProcessor.new
    @processor.stub(:result).and_return(@result)
    @order = mock(Order)
  end

  it "should return a false result for no rules" do
    result = @processor.process(@order)
    result.should == @result
  end

  it "should run all rules" do
    rule = mock(ProcessorRule)
    rule.should_receive(:process).with(@order, @result)

    @processor.rules << rule
    @processor.process(@order)
  end

  it "should stop with the first failed rule" do
    failure_rule = mock(ProcessorRule)
    failure_rule.should_receive(:process).and_return(false)
    success_rule = mock(ProcessorRule)
    success_rule.should_not_receive(:process)

    @processor.rules << failure_rule
    @processor.rules << success_rule
    @processor.process(@order)
  end

  it "should set success to true" do
    @result.should_receive(:success=).with(true)
    @processor.rules << mock(ProcessorRule, :process => true)
    @processor.process(@order)
  end
end
