module PageHelper
  include Rails.application.routes.url_helpers

  def default_url_options
    {}
  end

  def goto_url
    @session.visit @url
  end

  def notice
    @session.find("#messages #notice").text
  end
end
