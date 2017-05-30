class CallbackRequest < ApplicationRecord
  # include Phonable

  SMS_VERIFICATION_URL = 'http://sms.ru/sms/send'

  validates :name, presence: true
  validates :email, presence: true, unless: 'phone_number.present?'
  validates :email, email: true, if: 'email.present?'

  validates :phone_number, presence: true, unless: 'email.present?'

  after_create :send_email
  after_create :send_sms_notification

  private

  def send_email
    CallbackRequestMailer.new_callback_request(self).deliver
  end

  def send_sms_notification
    return unless phone_number
    HTTParty.post(SMS_VERIFICATION_URL, body: sms_params).parsed_response
  end

  def sms_content
    "Имя: #{name} \nКонтактный номер: #{phone_number}"
  end

  def sms_params
    {
      api_id: Rails.application.secrets.sms_ru_api_id,
      text: sms_content,
      from: Rails.application.secrets.sms_ru_sender,
      to: Rails.application.secrets.recipient_phone_number
    }
  end
end
