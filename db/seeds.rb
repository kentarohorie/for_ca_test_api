require 'csv'

CSV.read('db/series.tsv', 'r:UTF-8', col_sep: "\t").each do |row|
  Series.create(id: row[0], name: row[1], content: row[2], highlight: row[3], casts: row[4], crews: row[5])
end

CSV.read('db/programs.tsv', 'r:UTF-8', col_sep: "\t").each do |row|
  Program.create(id: row[0], series_id: row[1], title: row[2], content: row[3], highlight: row[4], long: row[5], casts: row[6], crews: row[7])
end

CSV.read('db/channel_schedules.tsv', 'r:UTF-8', col_sep: "\t").each do |row|
  ChannelSchedule.create(id: row[0], channel: row[1], program_id: row[2], start_at: row[3], end_at: row[4])
end

CSV.read('db/comments.tsv', 'r:UTF-8', col_sep: "\t").each do |row|
  Comment.create(id: row[0], channel_schedule_id: row[1], text: row[2], posted_at: row[3])
end
