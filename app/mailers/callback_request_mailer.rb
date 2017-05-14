class CallbackRequestMailer < ApplicationMailer
  def new_callback_request(callback_request)
    @callback_request = callback_request
    mail(
      to: Rails.application.secrets.recipient_email,
      subject: "Заказ на обратный звонок №#{@callback_request.id}"
    )
  end
end
