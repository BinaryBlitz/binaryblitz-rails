class CallbackRequest < ApplicationRecord
  include Phonable

  SMS_VERIFICATION_URL = 'http://sms.ru/sms/send'.freeze

  validates :name, presence: true
  validates :phone_number, presence: true

  after_create :send_email
  after_create :send_sms_notification

  private

  def send_email
    CallbackRequestMailer.new_callback_request(self).deliver
  end

  def send_sms_notification
    HTTParty.post(SMS_VERIFICATION_URL, body: sms_params).parsed_response
  end

  def content
    "Имя: #{name} \nКонтактный номер: #{phone_number}"
  end

  def sms_params
    {
      api_id: Rails.application.secrets.sms_ru_api_id,
      text: content,
      from: Rails.application.secrets.sms_ru_sender,
      to: Rails.application.secrets.recipient_phone_number
    }
  end
end
