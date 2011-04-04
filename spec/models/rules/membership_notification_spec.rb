require 'spec_helper'

describe Rules::MembershipNotification do
  it "should send an email to the membership owner" do
    @order = Factory.build(:order_with_membership)
    @item = @order.items.first
    @product = @item.product
    @result = mock(ProcessorResult)

    @mail = mock('Mail')
    @mail.should_receive(:deliver)
    @notification = mock(Notifications)
    @notification.should_receive(:membership).with(@product.owner, [@item]).and_return(@mail)

    @rule = Rules::MembershipNotification.new
    @rule.stub(:notifications).and_return(@notification)
    
    @rule.process(@order, @result)
  end
end
