class Rules::MembershipNotification < ProcessorRule
  def process(order, result)
    items = order.items.select{ |i| i.product.kind == 'membership' }
    if items.length > 0
      items.each do |item|
        notifications.membership(item.product.owner, [item]).deliver
      end
    end

    return true
  end

  private
    def notifications
      Notifications
    end
end
