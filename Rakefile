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

desc 'Print out number of sightings in database table'
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

    path = args.view ? "sql/#{args.view}.sql" : 'sql/*.sql'

    Dir.glob(path) do |f|
        sql = IO.read f
        view = File.basename f, '.sql'
        sql.chomp! ';'
        DB.create_or_replace_view view, sql
        puts "Created view #{view}"
    end
end

desc 'Drop database public views'
task :drop_views, [:view] do |t, args|

    ds = DB["SELECT viewname FROM pg_views WHERE schemaname='public'"]

    if args.view
        if ds.from_self[:viewname=>args.view]
            DB.drop_view args.view
            puts "View #{args.view} dropped"
        else
            puts "View #{args.view} not found"
        end
    else
        ds.each do |v|
            DB.drop_view v[:viewname]
            puts "View #{v[:viewname]} dropped"
        end
    end
end
