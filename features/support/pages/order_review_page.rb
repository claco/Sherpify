class OrderReviewPage
  include PageHelper

  def initialize(session)
    @session = session
    @url = orders_path
  end

  def process_order
    @session.click_button('process')
  end
end
