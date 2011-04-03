When /^I process the order$/ do
  @page = @page.process_order
end

Then /^I should receive a processing complete message$/ do
  @page.notice.should include('processed successfully')
end

Then /^I should receive a packing slip for shipping$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should receive a packing slip for royalties$/ do
  pending # express the regexp above with the code you wish you had
end
