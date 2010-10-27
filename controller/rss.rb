require 'rss/maker'

class RssController < Controller
    engine :None

    def index
        lists = List.latest 7
        url = "http://#{request.http_host}"
        version = "2.0" # ["0.9", "1.0", "2.0"]

        content = RSS::Maker.make(version) do |m|
            m.channel.title = "Peterstone Birds Daily Lists"
            m.channel.link = url
            m.channel.description = "Latest Peterstone Birds lists as RSS feed"
            m.items.do_sort = true # sort items by date

            lists.each do |list|
                item = m.items.new_item
                item.title = "List for #{list[:list_date].strftime('%A %e %B')}"
                item.link = "#{url}/list/daily?sub_id=#{list[:sub_id]}"
                item.date = list.date_and_time
            end
        end

        content
    end
end
