class Reservation < ApplicationRecord
  belongs_to :rooms
  belongs_to :members
end
