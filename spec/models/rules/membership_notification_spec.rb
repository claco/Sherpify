require 'spec_helper'

describe Rules::MembershipNotification do
  let(:rule)          { subject }
  let(:order)         { Factory.build(:order_with_membership) }
  let(:item)          { order.items.first }
  let(:notifications) { mock(Notifications) }
  let(:result)        { mock(ProcessorResult) }
  let(:mail)          { mock('Mail') }

  describe "process" do
    it "should send a notification to the membership owner" do
      mail.should_receive(:deliver)

      notifications.should_receive(:membership)
        .with(item.product.owner, [item])
        .and_return(mail)

      rule.stub(:notifications).and_return(notifications)

      rule.process(order, result)
    end
  end
end
