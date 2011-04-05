require 'spec_helper'

describe OrderProcessor do
  let(:processor) { subject }
  let(:order)     { mock(Order) }
  let(:result)    { mock(ProcessorResult) }
  let(:rule)      { mock(ProcessorRule) }

  before {
    processor.stub(:result).and_return(result)
  }

  describe "process" do
    it "should set result success to false with no rules" do
      result.should_receive(:success=).with(false)

      processor.rules.clear
      processor.process(order)
    end

    it "should call process on each rule, passing order and result" do
      result.should_receive(:success=).with(false)
      rule.should_receive(:process).with(order, result)

      processor.rules << rule
      processor.process(order)
    end

    it "should stop processing rules when a rules process returns false" do
      result.should_receive(:success=).with(false)

      failure_rule = mock(ProcessorRule, :process => false)
      failure_rule.should_receive(:process).with(order, result)

      success_rule = mock(ProcessorRule, :process => true)
      success_rule.should_not_receive(:process)

      processor.rules << failure_rule << success_rule
      processor.process(order)
    end

    it "should set result success to true with successful rule process" do
      result.should_receive(:success=).with(false).once
      result.should_receive(:success=).with(true).once
      rule.stub(:process).and_return(true)

      processor.rules << rule
      processor.process(order)
    end
  end
end
