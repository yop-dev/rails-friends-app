class Friend < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :first_name, presence: true
  validates :email, uniqueness: { scope: :user_id }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
