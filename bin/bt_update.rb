require '../lib/birdtrack'

# Check for command line options
year_str = ARGV.shift if ARGV
this_year = Time.now.year

if year_str
    raise TypeError,
        "Integer argument expected" unless (year = year_str.to_i) > 0
    start_year = 2003
    if year < start_year || year > this_year
        raise ArgumentError,
            "Year argument should be between #{start_year} & #{this_year}"
    end
else
    year = this_year
end

test = false
test_path = File.expand_path('~/Projects/git/peterstonebirds/data/src/')

unless test
    subs_src =  BirdTrack::SUBS_URL + 'YEAR=YYYY&SORT=A'
    get_html_method = BirdTrack.method(:get_web_page)
    obs_src = BirdTrack::OBS_URL
else
    subs_src = test_path + '/list-submissions-YYYY.html'
    get_html_method = BirdTrack.method(:get_web_file)
    obs_src = test_path + '/SUB128722826315949590277580.html'
end

subs_src.sub!(/YYYY/, year.to_s)
obs_src.sub!(/YYYY/, year.to_s)

# filter out other sites
web_subs = BirdTrack.get_subs_list(subs_src, get_html_method).
    reject! {|k,v| v[:site_name] !~ /Peterstone Gout/ }

# compare to BirdTrack sourced lists
deletes, updates = BirdTrack.get_new_subs year, web_subs

#p updates
#p deletes

if deletes.count > 5
    puts "Maximum number of deletes exceeded (#{deletes.count})"
else
    BirdTrack.process_subs_lists deletes, updates, obs_src, get_html_method
end


