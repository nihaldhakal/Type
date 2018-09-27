class AddReferenceToParticipatedRace < ActiveRecord::Migration[5.1]
  def change
    add_reference :participated_races, :user, {foreign_key: true}
  end
end
