class ChangeColumnTypesInRaceParticipant < ActiveRecord::Migration[5.1]
  def change
    change_column(:race_participants, :start_time, :datetime)
    change_column(:race_participants, :end_time, :datetime)
  end
end
