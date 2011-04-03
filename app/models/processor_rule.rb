class ProcessorRule
  def process(order, result)
    false
  end

  protected
    def packing_slip
      @slip ||= PackingSlip.new
    end
end
