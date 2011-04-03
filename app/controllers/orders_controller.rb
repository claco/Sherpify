class OrdersController < ApplicationController

  def index
    @order = orders.next_in_queue
  end

  def process_order
    order = orders.find(params[:id])
    result = processor.process(order)

    if result.success
      flash[:notice] = 'Order processed successfully!'
    end
  end

  private
    def orders
      Order
    end

    def processor
      if @processor.nil?
        @processor = OrderProcessor.new
        @processor.rules <<  Rules::ShippingPackingSlip.new
      end

      @processor
    end
end
