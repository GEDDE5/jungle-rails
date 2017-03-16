class CustomerMailerPreview < ActionMailer::Preview
  def order_receipt_preview
    CustomerMailer.order_receipt(Order.find(11))
  end
end
