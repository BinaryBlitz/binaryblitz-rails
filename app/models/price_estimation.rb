class PriceEstimation < ApplicationRecord
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :communication_method, inclusion: { in: %w(phone email) }
  validates :specification_stage, inclusion: { in: %w(complete half-complete none) }
  validate :valid_platforms
  validate :valid_registration_methods
  validate :valid_notification_methods

  private

  def valid_platforms
    unless (platforms - %w(ios android)).empty?
      errors.add(:base, 'platform is not from the list')
    end
  end

  def valid_registration_methods
    unless (registration_methods - %w(phone socials password)).empty?
      errors.add(:base, 'registration method is not from the list')
    end
  end

  def valid_notification_methods
    unless (notification_methods - %w(push email sms)).empty?
      errors.add(:base, 'notification method is not from the list')
    end
  end

end
