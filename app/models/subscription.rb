class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency_months, :customer_id, :tea_id
  
  belongs_to :customer
  belongs_to :tea
end
