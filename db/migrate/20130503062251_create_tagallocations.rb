class CreateTagallocations < ActiveRecord::Migration
  def change
    create_table :tagallocations do |t|
      t.string :name

      t.timestamps
    end
  end
end
