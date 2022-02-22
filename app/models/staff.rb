class Staff < ApplicationRecord
  has_many :employee_addresses, dependent: :destroy
  accepts_nested_attributes_for :employee_addresses, allow_destroy: true
  has_one_attached :document, dependent: :destroy
end
