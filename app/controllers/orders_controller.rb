class OrdersController < ApplicationController
  def index
    @order = Order.next_in_queue
  end

  def process_order

  end
end
