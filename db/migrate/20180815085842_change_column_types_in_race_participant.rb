class ChangeColumnTypesInRaceParticipant < ActiveRecord::Migration[5.1]
  def change
    change_column(:ParticipatedRaces, :start_time, :datetime)
    change_column(:ParticipatedRaces, :end_time, :datetime)
  end
end
