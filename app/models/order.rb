class Order < ActiveRecord::Base
  has_many :items, :class_name => 'OrderItem'

  def add(product)
    items << items.build(:product => product, :quantity => 1)
  end

  class << self
    def next_in_queue
      first
    end
  end
end
