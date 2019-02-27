class Residency < ApplicationRecord
  belongs_to :user
  belongs_to :transition

  def start_time
    self.date_start
  end

  def end_time
    self.date_end - 1.day
  end
end
