class Task < ActiveRecord::Base
  belongs_to :question
  attr_accessible :description, :task, :tag_list, :time, :complete
  has_paper_trail

  has_many :results
  acts_as_taggable
end
