class Task < ActiveRecord::Base
  belongs_to :question
  attr_accessible :description, :task, :tag_list, :time, :complete, :usersalloc_list
  has_paper_trail

  has_many :results
  acts_as_taggable
  acts_as_taggable_on :usersalloc
end
