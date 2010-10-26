require 'model/init.rb'

task :default => [:listcount]

desc "Print out number of lists in database table"
task :listcount do
    count = DB[:lists].count
    puts "Num of lists: #{count}"
end

desc "Update daily sightings from BirdTrack"
task :bt_update do
    puts "Running bt_update rake task..."
    ruby bin/bt_update.rb
end
