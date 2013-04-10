class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.text :description
      t.references :task

      t.timestamps
    end
    add_index :results, :task_id
  end
end
