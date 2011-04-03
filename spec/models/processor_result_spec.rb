require 'spec_helper'

describe ProcessorResult do
  before(:each) do
    @result = ProcessorResult.new
  end

  it "should default to unsuccessful" do
    @result.success.should be_false
  end
end
