class Result < ActiveRecord::Base
  belongs_to :task
  attr_accessible :description, :mount, :document
  has_paper_trail

  mount_uploader :document, DocumentUploader
end
