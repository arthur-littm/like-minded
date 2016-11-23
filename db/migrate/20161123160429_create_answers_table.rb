class CreateAnswersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :survey, foreign_key: true
      t.string :guest_name

      t.timestamps
    end
  end
end
