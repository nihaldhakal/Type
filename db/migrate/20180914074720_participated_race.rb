class ParticipatedRace < ActiveRecord::Migration[5.1]
  def change
    add_reference :participated_races, :race, {foreign_key: true}
  end
end
