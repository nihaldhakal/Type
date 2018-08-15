class RaceParticipant < ApplicationRecord

  def time_taken
    self.end_time - self.start_time
  end
end
