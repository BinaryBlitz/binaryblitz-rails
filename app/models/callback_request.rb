class CallbackRequest < ApplicationRecord
  include Phonable

  validates :name, presence: true
  validates :phone_number, presence: true

  after_create :send_email

  private

  def send_email
    CallbackRequestMailer.new_callback_request(self).deliver
  end
end
