class SupportRequest < ApplicationRecord
  validates :email, :content, presence: true
  validates :email, email: true
end
