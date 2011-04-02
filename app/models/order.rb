class Order < ActiveRecord::Base
  has_many :items, :class_name => 'OrderItem'

  def add(product)
    items << OrderItem.new(:order => self, :product => product, :quantity => 1)
  end
end
