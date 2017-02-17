class Program < ApplicationRecord
  belongs_to :series
  has_many :channel_schedules
end
