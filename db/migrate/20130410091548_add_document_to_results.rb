class AddDocumentToResults < ActiveRecord::Migration
  def change
    add_column :results, :document, :string
  end
end
