require 'spec_helper'
describe Room, 'validation' do
  it { should validate_inclusion_of(:building).in_array(%w('D.H. Hill', 'James. B. Hunt')).with_message('Building must be D.H. Hill or James. B. Hunt') }
  it { should validate_inclusion_of(:size).in_array(%w('low','medium','high')).with_message('Size must be low, medium or high') }
  it { should validate_inclusion_of(:status).in_array(%w('available', 'booked')).with_message('Status must be available or booked') }
  it { should validate_uniqueness_of(:room_number) }
end

describe Room, 'association' do
  it { should have_many(:reservations) }
  it { should belong_to(:members) }
end