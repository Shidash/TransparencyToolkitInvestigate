class Question < ActiveRecord::Base
  attr_accessible :details, :question

  has_many :tasks, :dependent => :destroy
end
