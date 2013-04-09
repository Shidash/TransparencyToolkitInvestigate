class Question < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :details, :question

  has_many :tasks, :dependent => :destroy
end
