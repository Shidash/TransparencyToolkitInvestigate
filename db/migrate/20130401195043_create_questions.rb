class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :details
      t.references :topic

      t.timestamps
    end
    add_index :questions, :topic_id
  end
end
