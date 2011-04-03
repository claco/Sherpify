require 'factory_girl'

Factory.define(:order) do |o|
end

Factory.define(:order_with_items, :parent => :order) do |o|
  o.after_build do |o|
    o.add Factory.build(:product)
  end
end

Factory.define(:order_with_physical_item, :parent => :order) do |o|
  o.after_build do |o|
    o.add Factory.build(:physical_product)
  end
end
