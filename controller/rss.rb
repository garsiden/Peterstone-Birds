require 'rss/maker'

class RssController < Controller
    engine :None

    def index
        lists = List.latest
        url = "http://#{request.http_host}" #localhost:7000'
        version = "2.0" # ["0.9", "1.0", "2.0"]

        content = RSS::Maker.make(version) do |m|
            m.channel.title = "Example BirdTrack RSS feed"
            m.channel.link = url
            m.channel.description = "Latest BirdTrack lists as RSS feed"
            m.items.do_sort = false # sort items by date

            i = m.items.new_item
            i.title = "List for #{lists[0][:list_date].strftime('%d %B %Y')}"
            i.link = "#{url}/list/daily?sub_id=#{lists[0][:sub_id]}"
            i.date = Time.parse(lists[0][:list_date].to_s)

            i = m.items.new_item
            i.title = "List for #{lists[1][:list_date].strftime('%d %B %Y')}"
            i.link = "#{url}/daily?sub_id=#{lists[1][:sub_id]}"
            i.date = Time.now #lists[1][:list_date] #Time.now
        end

        content
    end
end
