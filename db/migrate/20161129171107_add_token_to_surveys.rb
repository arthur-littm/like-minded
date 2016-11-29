class AddTokenToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :token, :string
  end
end
