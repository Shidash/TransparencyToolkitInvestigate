class Task < ActiveRecord::Base
  belongs_to :question
  attr_accessible :description, :task, :tag_list, :time

  has_many :results
  acts_as_taggable
end
