class ChangeRaceParticipantToParticipatedRace < ActiveRecord::Migration[5.1]
  def change
    rename_table :ParticipatedRaces, :participated_races
  end
end
