class Pokemon < ApplicationRecord
  validates :number, presence: true
  validates :name, presence: true
end
