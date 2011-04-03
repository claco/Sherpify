class Rules::RoyaltyPackingSlip < ProcessorRule
  def process(order, result)
    items = order.items.select{ |i| i.product.kind == 'book' }

    if items.length > 0
      packing_slip.type = :royalties

      items.each do |item|
        packing_slip.items << item
      end

      result.packing_slips << packing_slip
    end

    return true
  end
end
