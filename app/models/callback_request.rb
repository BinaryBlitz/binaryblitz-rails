class CallbackRequest < ApplicationRecord
  include Phonable

  validates :name, presence: true
  validates :phone_number, presence: true
end
