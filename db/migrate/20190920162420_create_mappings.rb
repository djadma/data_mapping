class CreateMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :mappings do |t|
      t.string :title
      t.timestamps
    end
    add_index :mappings, :title, unique: true
  end
end
