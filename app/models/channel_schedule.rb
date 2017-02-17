class ChannelSchedule < ApplicationRecord
  belongs_to :program
  has_many :comments
end
