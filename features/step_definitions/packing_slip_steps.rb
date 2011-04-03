Then /^the packing slip should contain the physical product$/ do
  @packing_slip.should include("(#{@item.quantity}) - #{@product.name}")
end

Then /^the packing slip should contain the book$/ do
  @packing_slip.should include("(#{@item.quantity}) - #{@product.name}")
end

