Spree::OrderMailer.class_eval do
  def confirm_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
    if @order.dibs_referral
      mail(to: @order.email, from: from_address, subject: subject, cc: @order.dibs_referral.email) do |format|
        format.text
        format.html
      end
    else
      mail(to: @order.email, from: from_address, subject: subject) do |format|
        format.text
        format.html
      end
    end
  end

  def cancel_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.cancel_email.subject')} ##{@order.number}"
    if @order.dibs_referral
      mail(to: @order.email, from: from_address, subject: subject, cc: @order.dibs_referral.email) do |format|
        format.text
        format.html
      end
    else
      mail(to: @order.email, from: from_address, subject: subject) do |format|
        format.text
        format.html
      end
    end
  end

  def void_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.void_email.subject')} ##{@order.number}"
    if @order.dibs_referral
      mail(to: @order.email, from: from_address, subject: subject, cc: @order.dibs_referral.email) do |format|
        format.text
        format.html
      end
    else
      mail(to: @order.email, from: from_address, subject: subject) do |format|
        format.text
        format.html
      end
    end
  end

  def capture_email(order, resend = false)
    @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
    subject = (resend ? "[#{Spree.t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{Spree.t('order_mailer.capture_email.subject')} ##{@order.number}"
    if @order.dibs_referral
      mail(to: @order.email, from: from_address, subject: subject, cc: @order.dibs_referral.email) do |format|
        format.text
        format.html
      end
    else
      mail(to: @order.email, from: from_address, subject: subject) do |format|
        format.text
        format.html
      end
    end
  end
end
