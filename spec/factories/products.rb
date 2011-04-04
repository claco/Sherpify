require 'factory_girl'

Factory.define(:product) do |p|
  p.price 1.00
  p.sequence(:name) {|n| "Product #{n}"}
end

Factory.define(:physical_product, :parent => :product) do |p|
  p.delivery 'physical'
end

Factory.define(:book, :parent => :physical_product) do |b|
  b.kind 'book'
  b.name 'Parry Hotter: Rise of The Rspec'
end

Factory.define(:membership, :parent => :product) do |m|
  m.delivery 'electronic'
  m.kind 'membership'
  m.name 'Kracklin of the Month Club'
  m.owner 'owner@example.com'
end
