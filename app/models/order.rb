class Order < ApplicationRecord
  belongs_to    :user
  belongs_to    :item
  has_one       :delivery_address
  attr_accessor :token
end
