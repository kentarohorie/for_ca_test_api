class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.references :series
      t.string :title
      t.text :content
      t.text :highlight
      t.integer :long
      t.string :casts
      t.string :crews
      t.timestamps
    end
  end
end
