class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :channel_schedule
      t.text :text
      t.datetime :posted_at
      t.timestamps
    end
  end
end
