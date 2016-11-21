class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.date :start_date
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
