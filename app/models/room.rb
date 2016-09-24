class Room < ApplicationRecord
  validates_inclusion_of :building, in: Choices['building']
  validates_inclusion_of :size, in: Choices['size']
  validates_inclusion_of :status, in: Choices['status']
  validates :room_number, uniqueness:true

  has_many :reservations
  belongs_to :members
end
