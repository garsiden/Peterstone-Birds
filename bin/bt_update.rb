#! /usr/bin/env ruby

require 'lib/birdtrack'

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

year = Time.now.year
subs_src.sub!(/YYYY/, year.to_s)
obs_src.sub!(/YYYY/, year.to_s)

p subs_src

# filter out other sites
web_subs = BirdTrack.get_subs_list(subs_src, get_html_method).select {
    |w| w[:site_name] =~ /Peterstone Gout/
}

# compare to BirdTrack sourced lists
updates = BirdTrack.get_new_subs year, web_subs

p updates
BirdTrack.process_subs_lists updates, obs_src, get_html_method


