class Camper < ApplicationRecord
  has_many :signups
  has_many :activities, through: :signups

  # As a user, I should be able to fill out a form to create a new 
  # `camper`, with their names (which must be unique) and age (which 
  # must be between 8 and 18)!

  validates :name, :presence => true, :uniqueness => true 
  validates :age, :presence => true, numericality: { greater_than: 7, less_than: 19}

  accepts_nested_attributes_for :signups
end
