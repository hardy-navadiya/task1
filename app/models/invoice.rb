class Invoice < ApplicationRecord
  belongs_to :client
  has_one_attached :document
end
