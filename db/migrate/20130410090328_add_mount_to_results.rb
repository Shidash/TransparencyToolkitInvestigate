class AddMountToResults < ActiveRecord::Migration
  def change
    add_column :results, :mount, :string
  end
end
