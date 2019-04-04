class Store < ApplicationRecord
  has_many :pets
  has_many :supplies
end
