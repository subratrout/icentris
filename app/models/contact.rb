class Contact < ActiveRecord::Base
  belongs_to :user
  validates :name, :email, :address, presence: true
  validates :phone, presence: true, length: { maximum: 12 }, format: { with: /\d{3}-\d{3}-\d{4}/, message: "must be XXX-XXX-XXXX format" }
end
