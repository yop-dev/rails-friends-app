class Friend < ApplicationRecord
  # Validations can go here
  validates :first_name, presence: true
end
