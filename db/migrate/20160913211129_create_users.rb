class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.boolean :is_admin
      t.boolean :is_preconfigured

      t.timestamps
    end
  end
end
