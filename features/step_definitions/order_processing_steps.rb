When /^I process the order$/ do
  @page = @page.process_order
end

Then /^I should receive a processing complete message$/ do
  @page.notice.should include('processed successfully')
end

Then /^I should receive a packing slip for (\w+)/ do |department|
  @packing_slip = @page.get_packing_slip(department)
  @packing_slip.should_not be_empty
end
