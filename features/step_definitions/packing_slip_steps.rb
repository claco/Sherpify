Then /^the packing slip should contain the physical product$/ do
  @packing_slip.should include("(#{@item.quantity}) - #{@product.name}")
end

Then /^the packing slip should contain the book$/ do
  pending # express the regexp above with the code you wish you had
end

