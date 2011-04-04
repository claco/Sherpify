require "spec_helper"

describe Notifications do
  describe "membership" do
    let(:product) { mock(Product, :name => 'foo') }
    let(:items) { [ mock(OrderItem, :quantity => 1, :product => product) ] }
    let(:owner) { 'email@example.com' }
    let(:mail) { Notifications.membership(owner, items) }

    it "renders the headers" do
      mail.subject.should eq("Membership Notification")
      mail.to.should eq([owner])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should include("(#{items[0].quantity}) - #{product.name}")
    end
  end

end
