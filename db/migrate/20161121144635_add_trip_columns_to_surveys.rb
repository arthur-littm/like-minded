class AddTripColumnsToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :city, :string
    add_column :surveys, :start_date, :date
  end
end
