class Race < ApplicationRecord
  before_save :strip_value

  private
  def strip_value
    self.value = self.value.strip
  end

  private

end
