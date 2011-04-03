class ProcessorResult
  attr_accessor :success, :packing_slips

  def initialize
    @success = false
    @packing_slips = []
  end
end
