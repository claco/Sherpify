class OrderProcessedPage
  include PageHelper

  def initialize(session)
    @session = session
  end

  def get_packing_slip(department)
    @session.find("#packing-slips .#{department}").text
  end
end
