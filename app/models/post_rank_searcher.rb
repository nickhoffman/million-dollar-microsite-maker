class PostRankSearcher
  def self.search_by_topic(topic)
    raise ArgumentError, 'The "topic" argument must be a String.' unless topic.is_a? String

    require 'net/http'
    require 'nokogiri'

    query       = build_topic_query topic
    response    = Net::HTTP.get_response URI.parse query
    xml         = Nokogiri::XML response.body
    feed_hashes = []
    @articles   = []

    xml.xpath('/feeds/feed')[0..3].map do |node|
      xml_hash    = node.children.at('//xml-hash').text
      description = node.children.at('//description').text

      @articles.push({
        :feed_hash    => xml_hash,
        :description  => description
      })
    end

    @articles.each do |article|
      query     = build_top_posts_query article[:feed_hash]
      puts "top posts query = #{query}"
      response  = Net::HTTP.get_response URI.parse query
      xml       = Nokogiri::XML response.body

      article[:title] = xml.xpath('/results/items/item/title').text
      article[:url]   = xml.xpath('/results/items/item/original_link').text
    end
  end

  def self.build_topic_query(topic)
    raise ArgumentError, 'The "topic" argument must be a String.' unless topic.is_a? String

    "http://www.postrank.com/topic/#{topic}?format=xml"
  end

  def self.build_top_posts_query(feed_hash)
    raise ArgumentError, 'The "feed_hash" argument must be a String.' unless feed_hash.is_a? String

    "http://api.postrank.com/v2/feed/#{feed_hash}/topposts?" +
      "appkey=#{POSTRANK['API_key']}&" +
      "format=xml&" +
      "num=1"
  end
end
