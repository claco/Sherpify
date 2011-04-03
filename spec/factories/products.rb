require 'factory_girl'

Factory.define(:product) do |p|
  p.price 1.00
  p.sequence(:name) {|n| "Product #{n}"}
end

Factory.define(:physical_product, :parent => :product) do |p|
  p.delivery 'physical'
end
