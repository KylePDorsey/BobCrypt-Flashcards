class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :cards
  has_many :rounds
  has_many :players, :through => :rounds, :source => :user

  validates :theme, :presence => true, :uniqueness => true
end
