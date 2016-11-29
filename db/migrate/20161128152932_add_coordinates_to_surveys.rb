class AddCoordinatesToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :latitude, :float
    add_column :surveys, :longitude, :float
  end
end
