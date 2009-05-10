xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.rss :'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd', :version => '2.0' do
  xml.channel do
    xml.title(@podcast.title)
    xml.description(@podcast.description)
    xml.link(podcast_url(@podcast))
    xml.language(@podcast.language)
    
    xml.copyright("Copyright #{Date.today.year}")
    xml.lastBuildDate(@podcast.updated_at.xmlschema)
    xml.pubDate(@podcast.created_at.xmlschema)
    xml.webMaster(@podcast.author)

    xml.itunes :author, @podcast.author
    xml.itunes :subtitle, @podcast.subtitle
    xml.itunes :summary, @podcast.summary
    
    xml.itunes :owner do
      xml.itunes :name, @podcast.owner_name
      xml.itunes :email, @podcast.owner_email
    end

    xml.itunes :explicit, (@podcast.explicit? ? "Yes" : "No")
    
    
    # <itunes:image href="http://www.podcast411.com/img/411_itunes.jpg"/>
    # 
    # <itunes:category text="Technology">
    #      <itunes:category text="Podcasting"/>
    # </itunes:category>
    
    @podcast.episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.link episode.link
        xml.guid episode.guid
        xml.description episode.description

        xml.enclosure :url => "http://podcast.local#{episode.media.url}", :length => episode.media_duration, :type => episode.media_content_type

        # <category>Podcasts</category>
        xml.pubDate episode.updated_at.xmlschema

        xml.itunes :author, episode.author
        
        # <itunes:explicit>No</itunes:explicit>
        xml.itunes :subtitle, episode.subtitle
        xml.itunes :summary, episode.summary
        xml.itunes :duration, duration_seconds_to_hh_mm_ss(episode.media_duration)
        xml.itunes :keywords, episode.keywords
      end
    end
  end
end