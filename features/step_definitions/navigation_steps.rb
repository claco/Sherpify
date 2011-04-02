def get_current_session
  Capybara.current_session
end

Given /^I goto the order review page$/ do
  @page = OrderReviewPage.new(get_current_session)
  @page.goto_url
end
