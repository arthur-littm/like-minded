class DropSurveyFriends < ActiveRecord::Migration[5.0]
  def change
    drop_table :survey_friends
  end
end
