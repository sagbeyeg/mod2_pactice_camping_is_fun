class Signup < ApplicationRecord
  belongs_to :activity
  belongs_to :camper

  validates :time, presence: true, numericality: [0..23]
end
