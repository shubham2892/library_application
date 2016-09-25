class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.date :startdate
      t.time :starttime
      t.time :endtime
      t.timestamps
    end
  end
end
