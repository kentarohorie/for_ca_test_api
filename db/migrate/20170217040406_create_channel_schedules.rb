class CreateChannelSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :channel_schedules do |t|
      t.string :channel
      t.references :program
      t.datetime :start_at
      t.datetime :end_at
      t.timestamps
    end
  end
end
