Spree::Admin::PaymentsController.class_eval do
  after_filter :dibs_fire, only: :fire

  def dibs_fire
    return unless event = params[:e] and @payment.payment_source

    if event == 'capture'
      Spree::OrderMailer.capture_email(@order).deliver
    elsif event == 'void'
      Spree::OrderMailer.void_email(@order).deliver
    end
  end
end
