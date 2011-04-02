class OrderReviewPage
  include PageHelper
    
  def initialize(session)
    @session = session
    @url = orders_path
  end
end
