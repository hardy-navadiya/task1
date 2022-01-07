class Client < ApplicationRecord
	before_save { self.email = email.downcase }
	regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 40}
	validates :email, presence: true, length: {maximum: 255}, format: { with: regex },uniqueness: { case_sensitive: false }

	has_many :invoices, dependent: :destroy
end
