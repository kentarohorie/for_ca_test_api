class CreateSeries < ActiveRecord::Migration[5.0]
  def change
    create_table :series do |t|
      t.string :name
      t.text :content
      t.text :highlight
      t.string :casts
      t.string :crews
      t.timestamps
    end
  end
end
