class Allocating < ActiveRecord::Base
  belongs_to :tagallocation
  belongs_to :task
  # attr_accessible :title, :body
end
