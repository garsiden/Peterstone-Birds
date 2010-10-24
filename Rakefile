require 'model/init.rb'

task :default => [:listcount]

desc "Print out number of lists in database table"
task :listcount do
    count = DB[:lists].count
    puts "Num of lists: #{count}"
end
