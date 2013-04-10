class Result < ActiveRecord::Base
  belongs_to :task
  attr_accessible :description, :mount, :document

  mount_uploader :document, DocumentUploader
end
