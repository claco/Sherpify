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

Factory.define(:order_with_book, :parent => :order) do |o|
  o.after_build do |o|
    o.add Factory.build(:book)
  end
end

Factory.define(:order_with_membership, :parent => :order) do |o|
  o.after_build do |o|
    o.add Factory.build(:membership)
  end
end
