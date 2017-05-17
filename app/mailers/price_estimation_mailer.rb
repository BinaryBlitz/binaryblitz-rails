class PriceEstimationMailer < ApplicationMailer
  def new_price_estimation(price_estimation)
    @price_estimation = price_estimation
    mail(
      to: Rails.application.secrets.recipient_email,
      subject: "Заказ на оценку стоимости №#{@price_estimation.id}"
    )
  end
end
