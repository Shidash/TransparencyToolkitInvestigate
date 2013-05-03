class Task < ActiveRecord::Base
  belongs_to :question
  attr_accessible :description, :task, :tag_list, :time, :complete
  has_paper_trail

  has_many :results
  has_many :allocatings
  has_many :tagallocations, through: :allocatings
  acts_as_taggable

  def self.allocated_to(name)
    Tagallocation.find_by_name!(name).tasks
  end

  def self.allocate_counts
    Tagallocation.select("tagallocations.*, count(allocatings.tagallocation_id) as count").
      joins(:allocatings).group("allocatings.tagallocation_id")
  end

  def tagallocation_list
    tagallocations.map(&:name).join(", ")
  end

  def tagallocation_list=(names)
    self.tagallocation = names.split(",").map do |n|
      Tagallocation.where(name: n.strip).first_or_create!
    end
  end
end
