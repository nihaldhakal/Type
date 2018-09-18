class Race < ApplicationRecord
  before_save :strip_value
  has_many :participated_races

  private
  def strip_value
    self.value = self.value.strip
  end

  private

end
