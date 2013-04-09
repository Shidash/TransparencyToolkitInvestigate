class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.text :description
      t.references :question

      t.timestamps
    end
    add_index :tasks, :question_id
  end
end
