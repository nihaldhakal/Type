class ParticipatedRace < ApplicationRecord
  belongs_to :race

  def time_taken
    self.end_time - self.start_time
  end

end
