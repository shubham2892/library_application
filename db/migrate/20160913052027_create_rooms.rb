class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :building
      t.string :size
      t.string :status
      t.timestamps

    end
  end
end
