class Rules::ShippingPackingSlip < ProcessorRule
  def process(order, result)
    items = order.items.select{ |i| i.product.physical? }

    if items.length > 0
      packing_slip.type = :shipping

      items.each do |item|
        packing_slip.items << item
      end

      result.packing_slips << packing_slip
    end

    return true
  end

  private
    def packing_slip
      @slip ||= PackingSlip.new
    end
end
