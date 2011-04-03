class OrdersController < ApplicationController
  def index
    @order = Order.next_in_queue
  end

  def process_order
    flash[:notice] = 'Order processed successfully!'
  end
end
