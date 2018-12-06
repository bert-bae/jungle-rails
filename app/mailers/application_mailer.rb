class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def order_email(orderinfo)
    @order = orderinfo
    mail(to: @order.email, subject: "Order confirmation: #{@order.id}")
  end
end
