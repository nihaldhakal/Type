class ChangeRaceParticipantToParticipatedRace < ActiveRecord::Migration[5.1]
  def change
    rename_table :race_participants, :participated_races
  end
end
