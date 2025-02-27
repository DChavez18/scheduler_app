class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
