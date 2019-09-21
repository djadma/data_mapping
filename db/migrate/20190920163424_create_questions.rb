class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :role_id
      t.integer :mapping_id
      t.timestamps
    end
  end
end
