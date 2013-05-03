class CreateAllocatings < ActiveRecord::Migration
  def change
    create_table :allocatings do |t|
      t.belongs_to :tagallocation
      t.belongs_to :task

      t.timestamps
    end
    add_index :allocatings, :tagallocation_id
    add_index :allocatings, :task_id
  end
end
