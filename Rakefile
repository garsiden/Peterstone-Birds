require 'model/init.rb'

task :default => [:listcount]

task :listcount do
    count = DB[:lists].count
    puts "Num of lists: #{count}"
end
