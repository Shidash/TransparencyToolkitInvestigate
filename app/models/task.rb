class Task < ActiveRecord::Base
  belongs_to :question
  attr_accessible :description, :task
end
