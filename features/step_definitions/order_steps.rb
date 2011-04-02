Given /^I have an order$/ do
  @order = Factory.create(:order)
end

Given /^the order has been paid for$/ do
  pass 'step here for story clarity if story / implemented elsewhere'
end

Given /^the order has a physical product$/ do
  @product = Factory.create(:physical_product)
  @order.add(@product)
end

Given /^the order has a book$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the order has a membership$/ do
  pending # express the regexp above with the code you wish you had
end

