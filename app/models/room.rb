class Room < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  validates_inclusion_of :building, in: Choices['building']
  validates_inclusion_of :size, in: Choices['size']
  validates_inclusion_of :status, in: Choices['status']
  validates :room_number, uniqueness:true

  def set_defaults
    self.status = 'available'
  end
end
