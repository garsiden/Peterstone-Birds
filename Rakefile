require 'model/init.rb'

task :default => [:lists]

desc "Heroku cron task"
task :cron do
    puts 'Running Heroku cron job...'
    Rake::Task[:bt_update].execute
end

desc "Print out number of lists in database table"
task :lists do
    count = DB[:lists].count
    puts "Number of lists: #{count}"
end

desc "Update daily sightings from BirdTrack"
task :bt_update, [:year] do |t, args|
    puts "Running bt_update rake task..."
    ruby "bin/bt_update.rb #{args.year}"
end

desc 'Print out number of sightings in database tabel'
task :sightings do
    count = DB[:sightings].count
    puts "Number of sightings: #{count}"
end

desc 'Add foreign key constraints to database tables'
task :foreign_keys do
    ruby 'bin/foreign_keys.rb'
end

desc 'Create/replace database views from SQL files'
task :create_views, [:view] do |t, args|
    if args.length
        path = "sql/#{args.view}.sql"
    else
        path = 'sql/*.sql'
    end
    
    Dir.glob(path) do |f|
        sql = IO.read f
        view = File.basename f, '.sql'
        sql.chomp! ';'
        DB.create_or_replace_view view, sql
        puts "Created view #{view}"
    end
end
