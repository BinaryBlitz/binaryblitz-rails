class SupportRequestMailer < ApplicationMailer
  def new_support_request(support_request)
    @support_request = support_request
    mail(
      to: Rails.application.secrets.recipient_email,
      subject: "Запрос на обработку №#{@support_request.id}"
    )
  end
end
