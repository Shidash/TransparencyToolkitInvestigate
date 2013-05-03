class Tagallocation < ActiveRecord::Base
  attr_accessible :name

  has_many :allocatings
  has_many :tasks, through: :allocatings
end
