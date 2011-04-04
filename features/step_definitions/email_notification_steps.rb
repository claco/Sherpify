Then /^an email notification is sent to the membership owner$/ do
  @email = ActionMailer::Base.deliveries.first
  @email.to.first.should == @product.owner
end

Then /^the email should contain the membership purchased$/ do
  @email.body.should include("(#{@item.quantity}) - #{@product.name}")
end

