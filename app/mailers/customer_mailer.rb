class CustomerMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt(order)
    @order = order
    @total = "$#{(@order.total_cents.to_f / 100).round(2).to_s}"
    mail(to: @order.email, subject: "[Jungle] OrderID - #{@order.id} - Order receipt")
  end
end
