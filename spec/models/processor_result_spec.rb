require 'spec_helper'

describe ProcessorResult do
  let(:result) { subject }

  describe "success" do
    it "should return false by default" do
      result.success.should be_false
    end
  end
end
