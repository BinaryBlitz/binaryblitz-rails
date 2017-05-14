class SupportRequest < ApplicationRecord
  validates :email, :content, presence: true
  validates :email, email: true

  after_create :send_email

  private

  def send_email
    SupportRequestMailer.new_support_request(self).deliver
  end
end
