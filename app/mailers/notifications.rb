class Notifications < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.membership.subject
  #
  def membership(owner, items)
    @items = items

    mail :to => owner, :subject => 'Membership Notification'
  end
end
